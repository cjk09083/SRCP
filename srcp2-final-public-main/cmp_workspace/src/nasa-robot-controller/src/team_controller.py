#!/usr/bin/env python3
from __future__ import print_function

# basic ros import
import rospy
import rosparam
import rosservice
import rospkg

# ros msg imports
from gazebo_msgs.msg import ModelStates
from std_msgs.msg import Float64, Header, Int32, Bool
from geometry_msgs.msg import Pose, PoseStamped
from nav_msgs.msg import Path
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from srcp2_msgs.msg import VolSensorMsg, SystemMonitorMsg
import tf

# python imports
import math
import numpy as np
import time
import pandas as pd
import yaml
import copy

class TeamController():
    def __init__(self):
        rospy.init_node('team_controller', anonymous=True)

        # get the ros package path
        rospack = rospkg.RosPack()
        self.pkg_path = rospack.get_path('nasa_srcp_final')

        # id of the team of robot (either 1 or 2)
        self.team_id = str(rospy.get_param('~team_id'))

        # publishers to set goal position for each robot
        self.scout_goal_pub = rospy.Publisher("/small_scout_" + self.team_id + "/goal_pos", Pose, queue_size=10)
        self.excavator_goal_pub = rospy.Publisher("/small_excavator_" + self.team_id + "/goal_pos", Pose, queue_size=10)
        self.hauler_goal_pub = rospy.Publisher("/small_hauler_" + self.team_id + "/goal_pos", Pose, queue_size=10)

        # publishers to stop the motion of the robot
        self.scout_stop_pub = rospy.Publisher("/small_scout_" + self.team_id + "/stop", Bool, queue_size=10)
        self.excavator_stop_pub = rospy.Publisher("/small_excavator_" + self.team_id + "/stop", Bool, queue_size=10)
        self.hauler_stop_pub = rospy.Publisher("/small_hauler_" + self.team_id + "/stop", Bool, queue_size=10)

        # subscribe to goal of each robot
        self.scout_pose_sub = rospy.Subscriber("/small_scout_" + self.team_id + "/pose", Pose, self.scout_pose_cb)
        self.excavator_pose_sub = rospy.Subscriber("/small_excavator_" + self.team_id + "/pose", Pose, self.excavator_pose_cb)
        self.hauler_pose_sub = rospy.Subscriber("/small_hauler_" + self.team_id + "/pose", Pose, self.hauler_pose_cb)
        self.scout_loc = np.array([0.0, 0.0])
        self.excavator_loc = np.array([0.0, 0.0])
        self.hauler_loc = np.array([0.0, 0.0])

        # subscribe to the volatile sensor of the scout
        self.scout_vol_sub = rospy.Subscriber("/small_scout_" + self.team_id + "/volatile_sensor", VolSensorMsg, self.volatile_cb)
        
        # read the offsets for station and other robots from the yaml file
        offset_file = open(self.pkg_path + "/config/offsets.yaml", 'r')
        self.offsets = yaml.load(offset_file)

        # get spawn location for the trial
        self.scout_pose = self.get_robot_pose("/small_scout_", True)
        if self.scout_pose is None:
            self.scout_pose = Pose()
            self.scout_pose.position.x = 11
            self.scout_pose.position.y = 5.0
            self.scout_pose.position.z = 1.648
            self.scout_pose.orientation.x = 0.0
            self.scout_pose.orientation.y = 0.0
            self.scout_pose.orientation.z = 0.3818
            self.scout_pose.orientation.w = 0.92422
        else:
            self.scout_pose = self.scout_pose.pose
        self.scout_offset = np.array([math.ceil(self.scout_pose.position.x), math.ceil(self.scout_pose.position.y)])
        self.spawn_center = self.scout_offset - np.array(self.offsets['scout_' + self.team_id])
        
        # get position  of the repair and processing station
        self.repair_station_pos = np.array(self.offsets['repair_station']) + self.spawn_center
        self.proc_station_pos = np.array(self.offsets['process_station']) + self.spawn_center

        # get pose of excavator and hauler
        self.excavator_pose = self.compute_pose_from_offset(self.scout_pose, self.offsets['excavator_' + self.team_id], self.spawn_center)
        self.hauler_pose = self.compute_pose_from_offset(self.scout_pose, self.offsets['hauler_' + self.team_id], self.spawn_center)

        # get global path from the csv file
        path_file_name = self.pkg_path + "/data/team_path_" + self.team_id + ".csv"
        self.global_path = pd.read_csv(path_file_name, delimiter=' ')
        self.waypoints = [tuple(x) for x in self.global_path.values]
        self.target_wp = 0
        
        # state machine to define the state of the team 
        # check readme for definition of each state
        self.state = 0
        self.state_pub = rospy.Publisher("/team_" + self.team_id + "/state", Int32, queue_size=10)

    def scout_pose_cb(self, data):
        '''
        Call back function for the scout position
        '''
        self.scout_pose = data
        self.scout_loc = np.array([self.scout_pose.position.x, self.scout_pose.position.y])
        orientation_list = [self.scout_pose.orientation.x, self.scout_pose.orientation.y, self.scout_pose.orientation.z, self.scout_pose.orientation.w]
        (_, _, self.scout_yaw) = euler_from_quaternion (orientation_list)

    def hauler_pose_cb(self, data):
        '''
        Call back function for the hauler position
        '''
        self.hauler_pose = data
        self.hauler_loc = np.array([self.hauler_pose.position.x, self.hauler_pose.position.y])
        orientation_list = [self.hauler_pose.orientation.x, self.hauler_pose.orientation.y, self.hauler_pose.orientation.z, self.hauler_pose.orientation.w]
        (_, _, self.hauler_yaw) = euler_from_quaternion (orientation_list)

    def excavator_pose_cb(self, data):
        '''
        Call back function for the excavator position
        '''
        self.excavator_pose = data
        self.excavator_loc = np.array([self.excavator_pose.position.x, self.excavator_pose.position.y])
        orientation_list = [self.excavator_pose.orientation.x, self.excavator_pose.orientation.y, self.excavator_pose.orientation.z, self.excavator_pose.orientation.w]
        (_, _, self.excavator_yaw) = euler_from_quaternion (orientation_list)

    def volatile_cb(self, data):
        '''
        Call back function for the volatile sensor on the scout
        '''
        self.volatile_dist = data.distance_to

        # volatile found and rovers are in exploration mode
        if self.volatile_dist != -1.0 and self.state == 0:
            print ("Volatile dist: ", str(self.volatile_dist))
            print ("Volatile type: ", data.vol_type)
            self.state = 1

    def control_scout(self):
        '''
        Controls the actions of the scout based on the current state
        '''
        if self.state == 0:
            goal_pt = np.array(self.waypoints[self.target_wp])
            dist_goal = np.linalg.norm(goal_pt - self.scout_loc)

            # update to next waypoint if too close
            if dist_goal < 1.0:
                self.target_wp += 1
                goal_pt = np.array(self.waypoints[self.target_wp])

            goal_pose = Pose()
            goal_pose.position.x = goal_pt[0]
            goal_pose.position.y = goal_pt[1]
            self.scout_goal_pub.publish(goal_pose)
            self.scout_stop_pub.publish(False)
        
        elif self.state == 1:
            self.scout_stop_pub.publish(True)

    def control_excavator(self):
        '''
        Controls the actions of the excavator based on the current state
        '''
        if self.state == 0:
            # distance of the excavator from scout
            distance_scout = np.linalg.norm(self.excavator_loc - self.scout_loc)
            if distance_scout > 5: # meters
                goal_pose = self.scout_pose
                self.excavator_goal_pub.publish(goal_pose)
                self.excavator_stop_pub.publish(False)
            else:
                self.excavator_stop_pub.publish(True)

        elif self.state == 1:
            self.excavator_stop_pub.publish(True)

    def control_hauler(self):
        '''
        Controls the actions of the hauler based on the current state
        '''
        if self.state == 0:
            # distance of the hauler from excavator
            distance_excavator = np.linalg.norm(self.hauler_loc - self.excavator_loc)
            if distance_excavator > 5: # meters
                goal_pose = self.excavator_pose
                self.hauler_goal_pub.publish(goal_pose)
                self.hauler_stop_pub.publish(False)
            else:
                self.hauler_stop_pub.publish(True)
        elif self.state == 1:
            self.hauler_stop_pub.publish(True)

    def compute_pose_from_offset(self, ref_pose, offset, spawn_center):
        '''
        Computes pose of a new robot based on the pose of another robot
        given the offsets and the spawn center
        '''
        robot_pose = copy.deepcopy(ref_pose)
        robot_pose.position.x = offset[0] + spawn_center[0]
        robot_pose.position.y = offset[1] + spawn_center[1]

        return robot_pose

    def get_robot_pose(self, robot_name, data):
        '''
        use the rosservice to get the position of a robot
        '''
        pose_service_name = robot_name  + self.team_id + '/get_true_pose'
        rospy.wait_for_service(pose_service_name)
        try:
            pose_srv_class = rosservice.get_service_class_by_name(pose_service_name)
            pose_srv_client = rospy.ServiceProxy(pose_service_name, pose_srv_class)
            robot_pos = pose_srv_client(data)
            return robot_pos
        except rospy.ServiceException as e:
            rospy.loginfo("Get true pose Service call failed: %s" % e)
            pass

    def spin(self):
        # controller runs at 10 Hz
        rate = rospy.Rate(10)

        while not rospy.is_shutdown():
            self.control_scout()
            self.control_excavator()
            self.control_hauler()
            self.state_pub.publish(int(self.state)) # publish the state of the team
            rate.sleep()

if __name__ == '__main__':
    try:
        tc = TeamController()
        tc.spin()

    except KeyboardInterrupt:
        print("Shutting down")