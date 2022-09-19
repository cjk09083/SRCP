#!/usr/bin/env python3
from __future__ import print_function

# basic ros import
import rospy
import roslib
roslib.load_manifest("rosparam")
import rosparam

# ros msg imports
from gazebo_msgs.msg import ModelStates
from std_msgs.msg import Float64, Header, Bool
from geometry_msgs.msg import Pose, PoseStamped
from nav_msgs.msg import Path
from tf.transformations import euler_from_quaternion, quaternion_from_euler
import tf

# python imports
import math
import numpy as np

class BaseController():
    def __init__(self):
        rospy.init_node('base_controller', anonymous=True)
        self.robot_name = rospy.get_param('~robot_name')

        # subscribe to gazebo state - used temporarily to get the pose of the robot
        self.gazebo_state_sub = rospy.Subscriber("/gazebo/model_states", ModelStates, self.model_state_callback)

        self.goal_sub = rospy.Subscriber("goal", Pose, self.goal_callback)
        self.path_sub = rospy.Subscriber("path", Path, self.path_callback)
        self.stop_sub = rospy.Subscriber("stop", Bool, self.stop_callback)
        # self.path_pub = rospy.Publisher("path", Path, queue_size=10)

        self.closest_index = None
        self.robot_pose = Pose()
        
        self.dist_error = 0.0
        self.yaw_error = 0.0
        self.previos_yaw_error = 0.0
        self.target = None

        # vehicle parameters
        self.wheel_base = 1.07 # L - m
        self.wheel_seperation = 1.0 # m
        self.wheel_radius = 0.17 # m
        self.steering_track = self.wheel_radius

        # target linear velocity
        self.lin_vel = -0.5 * 4 # ms-1
        
        # steer control
        self.p_steer = 0.01
        self.d_steer = 0.1

        # current steer angles - front and rear
        self.steer_fl= 0.0 
        self.steer_fr = 0.0
        self.steer_rl = 0.0
        self.steer_rr = 0.0

        # velocity of the front and rear axles
        self.wheel_vel = 0.0
        self.vel_fl = 0.0
        self.vel_fr = 0.0
        self.vel_rl = 0.0
        self.vel_rr = 0.0
        
        # velocity publishers
        self.fl_vel_pub = rospy.Publisher( "front_left_wheel/drive/command/velocity", Float64, queue_size=10)
        self.fr_vel_pub = rospy.Publisher( "front_right_wheel/drive/command/velocity", Float64, queue_size=10)
        self.bl_vel_pub = rospy.Publisher( "back_left_wheel/drive/command/velocity", Float64, queue_size=10)
        self.br_vel_pub = rospy.Publisher( "back_right_wheel/drive/command/velocity", Float64, queue_size=10)

        # steer angle publishers
        self.fl_st_pub = rospy.Publisher( "front_left_wheel/steer/command/position", Float64, queue_size=10)
        self.fr_st_pub = rospy.Publisher( "front_right_wheel/steer/command/position", Float64, queue_size=10)
        self.bl_st_pub = rospy.Publisher( "back_left_wheel/steer/command/position", Float64, queue_size=10)
        self.br_st_pub = rospy.Publisher( "back_right_wheel/steer/command/position", Float64, queue_size=10)

        # yaw error publisher
        self.yaw_error_pub = rospy.Publisher("yaw_error", Float64, queue_size=10)

        # flag to check whether the index of the robot in the robot states is found or not
        self.index_found = False
        self.robot_index = -1
        self.moving = False
        self.location_set = False

    def stop_callback(self, data):
        self.move = False

    def goal_callback(self, data):
        self.moving = True
        self.goal = data
        self.path_lenght = 1
        self.cur_target = 0

    def path_callback(self, data):
        print ("path received")
        self.moving = True
        self.path = data.poses
        self.path_length = len(self.path)
        self.trajectory = []
        for i in range (self.path_length):
            pt = self.path[i]
            t = [pt.pose.position.x, pt.pose.position.y, 0.0] # x, y and angle
            self.trajectory.append(t)
        self.cur_target = 0
        
    # callback for the model state from gazebo
    def model_state_callback(self, data):
        # update the index everytime
        if not self.index_found:
            names = data.name
            for i in range (len(names)):
                if names[i] == self.robot_name:
                    self.robot_index = i
                    self.index_found = True
                    break

        self.robot_pose = data.pose[self.robot_index]
        self.robot_twist = data.twist[self.robot_index]

        lin_vel = self.robot_twist.linear
        self.robot_vel = np.linalg.norm([lin_vel.x, lin_vel.y, lin_vel.z])

        orientation_list = [self.robot_pose.orientation.x, self.robot_pose.orientation.y, self.robot_pose.orientation.z, self.robot_pose.orientation.w]
        (self.roll, self.pitch, self.yaw) = euler_from_quaternion (orientation_list)
        
        cur_pos = [self.robot_pose.position.x, self.robot_pose.position.y, 0]
        
        # publish transform
        br = tf.TransformBroadcaster()
        base_footprint_name = self.robot_name + "_base_footprint"
        br.sendTransform(cur_pos, orientation_list, rospy.Time.now(), base_footprint_name, "map")
        self.location_set = True

    # update to the next waypoint based on distance
    def update_target(self):
        target = self.trajectory[self.cur_target]
        cur_pos = [self.robot_pose.position.x, self.robot_pose.position.y]
        self.dist_error = math.sqrt ( (target[0] - cur_pos[0])**2 + (target[1] - cur_pos[1])**2)
        
        if self.dist_error < 1.5 and not len(self.trajectory) == self.cur_target:
            self.cur_target_id += 1

        # stop the robot
        if self.dist_error < 0.25:
            self.moving = False
    
    def normalize_angle(self, angle):
        if angle > 180:
            angle = -360 + angle
        elif angle < -180:
            angle = 360 + angle
        return angle

    # compute error in the heading
    def compute_yaw_errors(self):
        target = self.trajectory[self.cur_target]
        cur_pos = [self.robot_pose.position.x, self.robot_pose.position.y]
        desired_yaw = math.degrees(math.atan2(target[1]-cur_pos[1], target[0]-cur_pos[0]))
        error_steer = desired_yaw - math.degrees(self.yaw)
        self.yaw_error = self.normalize_angle(error_steer)
        self.yaw_error_pub.publish(self.yaw_error)
        yaw_der = (self.yaw_error - self.previos_yaw_error)
        self.ang_vel = self.p_steer * self.yaw_error + self.d_steer * yaw_der

        self.previos_yaw_error = self.yaw_error

    def control(self):
        if(abs(self.lin_vel) > 0.01 and abs(self.ang_vel) > 0.01):
            self.ang_vel = self.ang_vel / 4 
            sign = np.sign(self.lin_vel)
            
            self.vel_fl = 0.1*sign*math.hypot(self.lin_vel - self.ang_vel*self.steering_track/2, self.ang_vel*self.wheel_base/2)/self.wheel_radius
            self.vel_fr = 0.1*sign*math.hypot(self.lin_vel + self.ang_vel*self.steering_track/2, self.ang_vel*self.wheel_base/2)/self.wheel_radius
            self.vel_rl = 0.1*sign*math.hypot(self.lin_vel + self.ang_vel*self.steering_track/2, self.ang_vel*self.wheel_base/2)/self.wheel_radius
            self.vel_rr = 0.1*sign*math.hypot(self.lin_vel - self.ang_vel*self.steering_track/2, self.ang_vel*self.wheel_base/2)/self.wheel_radius
            
            self.steer_fl = math.atan(self.ang_vel*self.wheel_base/(2*self.lin_vel + self.ang_vel*self.steering_track))*180/math.pi
            self.steer_fr = math.atan(self.ang_vel*self.wheel_base/(2*self.lin_vel - self.ang_vel*self.steering_track))*180/math.pi
            self.steer_rl = -self.steer_fl
            self.steer_rr = -self.steer_fr

        elif(abs(self.ang_vel) < 0.01):
            V = math.hypot(self.lin_vel, 0.0) / self.wheel_radius
            sign = np.sign(self.lin_vel)
            
            if(self.lin_vel != 0):
                ang = 0
            
            self.steer_fl = math.atan(ang)*180/math.pi
            self.steer_fr = math.atan(ang)*180/math.pi
            self.steer_rl= self.steer_fl
            self.steer_rr = self.steer_fr
            
            self.vel_fl = 0.1*sign*V
            self.vel_fr = 0.1*sign*V
            self.vel_rl = 0.1*sign*V
            self.vel_rr = 0.1*sign*V
            
        elif(abs(self.lin_vel) < 0.01 and abs(self.ang_vel) > 0.01):
            self.steer_fl = math.atan(-self.wheel_base/self.steering_track)*180/math.pi
            self.steer_fr = math.atan(self.wheel_base/self.steering_track)*180/math.pi
            self.steer_rl = -math.atan(self.wheel_base/self.steering_track)*180/math.pi
            self.steer_rr = -math.atan(-self.wheel_base/self.steering_track)*180/math.pi
            
            self.vel_fl = self.ang_vel / self.wheel_radius
            self.vel_fr = self.ang_vel / self.wheel_radius
            self.vel_rl = self.vel_fl
            self.vel_rr = self.vel_fr

    # publishes velocity and the steer angles for the wheels
    def send_command(self):
        self.fl_vel_pub.publish(self.vel_fl)
        self.fr_vel_pub.publish(self.vel_fr)
        self.bl_vel_pub.publish(self.vel_rl)
        self.br_vel_pub.publish(self.vel_rr)

        # publisht steer angle for each wheel
        self.fl_st_pub.publish(self.steer_fl)
        self.fr_st_pub.publish(self.steer_fr)
        self.bl_st_pub.publish(self.steer_rl)
        self.br_st_pub.publish(self.steer_rr)

    # publishes 0.0 as velocity and the steer angles for the wheels
    def stop(self):
        self.fl_vel_pub.publish(0.0)
        self.fr_vel_pub.publish(0.0)
        self.bl_vel_pub.publish(0.0)
        self.br_vel_pub.publish(0.0)

        # publisht steer angle for each wheel
        self.fl_st_pub.publish(0.0)
        self.fr_st_pub.publish(0.0)
        self.bl_st_pub.publish(0.0)
        self.br_st_pub.publish(0.0)

    def spin(self):
        # controller runs at 10 Hz
        rate = rospy.Rate(10)

        while not rospy.is_shutdown():
            if self.location_set and self.moving:
                self.update_target()
                self.compute_yaw_errors()
                self.control()
                self.send_command()
            else:
                self.stop()
            rate.sleep()

if __name__ == '__main__':
    try:
        bc = BaseController()
        bc.spin()

    except KeyboardInterrupt:
        print("Shutting down")