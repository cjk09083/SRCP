#!/usr/bin/env python3
from __future__ import print_function

# basic ros import
import rospy
import rosparam

# ros msg imports
from gazebo_msgs.msg import ModelStates
from geometry_msgs.msg import Pose

from tf.transformations import euler_from_quaternion, quaternion_from_euler
import tf

class PosePublisher():
    def __init__(self):
        rospy.init_node('pose_publisher', anonymous=True)
        self.gazebo_state_sub = rospy.Subscriber("/gazebo/model_states", ModelStates, self.model_state_callback)
        self.robot_name = rospy.get_param('~robot_name')
        self.index_found = False
        self.robot_index = -1

        self.pose_pub = rospy.Publisher(self.robot_name + "/pose", Pose, queue_size=10)

    def model_state_callback(self, data):
        if not self.index_found:
            names = data.name
            for i in range (len(names)):
                if names[i] == self.robot_name:
                    self.robot_index = i
                    break
        
        self.robot_pose = data.pose[self.robot_index]
        orientation_list = [self.robot_pose.orientation.x, self.robot_pose.orientation.y, self.robot_pose.orientation.z, self.robot_pose.orientation.w]
        
        cur_pos = [self.robot_pose.position.x, self.robot_pose.position.y, self.robot_pose.position.z]
        
        # publish transform
        br = tf.TransformBroadcaster()
        br.sendTransform(cur_pos, orientation_list, rospy.Time.now(), self.robot_name + "_base_footprint", "map")
        self.index_found = True

    def spin(self):
        # controller runs at 10 Hz
        rate = rospy.Rate(10)

        while not rospy.is_shutdown():
            if self.index_found:
                # publish the pose of the robot
                self.pose_pub.publish(self.robot_pose)
            rate.sleep()

if __name__ == '__main__':
    try:
        pp = PosePublisher()
        pp.spin()

    except KeyboardInterrupt:
        print("Shutting down")