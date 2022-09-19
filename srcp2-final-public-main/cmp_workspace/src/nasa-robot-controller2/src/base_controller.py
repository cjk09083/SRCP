#!/usr/bin/env python3
from __future__ import print_function

# basic ros import
import rospy
import roslib
roslib.load_manifest("rosparam")
import rosparam

# ros msg imports
from gazebo_msgs.msg import ModelStates
from std_msgs.msg import Float64, Header, Bool, Int32
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
        self.team_id = str(rospy.get_param('~team_id'))

        # subscribe to the state of the team
        self.state_sub = rospy.Subscriber("/team_" + self.team_id + "/state", Int32, self.state_cb)

        # subscribe to the pose of the robot
        self.pose_sub = rospy.Subscriber("pose", Pose, self.pose_cb)

        # subscriber to the goal of the robot
        self.goal_sub = rospy.Subscriber("goal_pos", Pose, self.goal_cb)

        # subscriber to the stop state of the robot
        self.stop_sub = rospy.Subscriber("stop", Bool, self.stop_cb)
        self.moving = False # flag to set whether robot can move or not
        
        # errors
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
        self.lin_vel = 0.5 * 4 # ms-1
        
        # steer control
        self.p_steer = 0.01
        self.d_steer = 0.2

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

    def state_cb(self, data):
        '''
        get the state of the robot
        '''
        self.state = data.data

    def goal_cb(self, data):
        '''
        set the goal pose 
        '''
        self.goal = data
        self.target = np.array([self.goal.position.x, self.goal.position.y])

    def pose_cb(self, data):
        '''
        Call back function for the robot position
        '''
        self.pose = data
        self.robot_loc = np.array([self.pose.position.x, self.pose.position.y])
        orientation_list = [self.pose.orientation.x, self.pose.orientation.y, self.pose.orientation.z, self.pose.orientation.w]
        (_, _, self.robot_yaw) = euler_from_quaternion (orientation_list)

    def stop_cb(self, data):
        '''
        set whether robot should move or not
        '''
        self.moving = not data.data

    def normalize_angle(self, angle):
        if angle > 180:
            angle = -360 + angle
        elif angle < -180:
            angle = 360 + angle
        return angle

    # compute error in the heading
    def compute_yaw_errors(self):
        desired_yaw = math.degrees(math.atan2(self.target[1]-self.robot_loc[1], self.target[0]-self.robot_loc[0]))
        error_steer = desired_yaw - math.degrees(self.robot_yaw)
        self.yaw_error = self.normalize_angle(error_steer)
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

    def send_command(self):
        '''
        publishes velocity and the steer angles for the wheels
        '''
        self.fl_vel_pub.publish(self.vel_fl)
        self.fr_vel_pub.publish(self.vel_fr)
        self.bl_vel_pub.publish(self.vel_rl)
        self.br_vel_pub.publish(self.vel_rr)

        # publisht steer angle for each wheel
        self.fl_st_pub.publish(self.steer_fl)
        self.fr_st_pub.publish(self.steer_fr)
        self.bl_st_pub.publish(self.steer_rl)
        self.br_st_pub.publish(self.steer_rr)

    def stop(self):
        '''
        publishes 0.0 as velocity and the steer angles for the wheels
        '''
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
            if self.moving:
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