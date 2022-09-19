#!/usr/bin/env python3
from __future__ import print_function

# basic ros import
import rospy
import roslib
roslib.load_manifest("rosparam")
import rosparam

# ros msg imports
from gazebo_msgs.msg import ModelStates
from std_msgs.msg import Float64, Header
from geometry_msgs.msg import Pose, PoseStamped
from nav_msgs.msg import Path
from tf.transformations import euler_from_quaternion, quaternion_from_euler
import tf

# python imports
import math
import numpy as np
import time

class MainController():
    def __init__(self):
        rospy.init_node('main_controller', anonymous=True)
        self.team_id = rospy.get_param('~team_id')
        self.scout_path_pub = rospy.Publisher("/small_scout_" + str(self.team_id) + "/path", Path, queue_size=10)

    def pub_path(self):
        time.sleep(5)        
        self.trajectory = [(12,4), (14,4), (16,4), (18,6), (20,8), (22,4)]
        path = Path()
        h = Header()
        h.frame_id = "map"
        pose_array = []
        for i in range (len(self.trajectory)):
            p = PoseStamped()
            h.seq = i
            p.header = h
            p.pose.position.x = self.trajectory[i][0]
            p.pose.position.y = self.trajectory[i][1]
            p.pose.position.z = 0.0
            p.pose.orientation.w = 1.0
            pose_array.append(p)
        path.header = h
        path.poses=pose_array
        self.scout_path_pub.publish(path)

    def spin(self):
        # controller runs at 10 Hz
        rate = rospy.Rate(10)

        while not rospy.is_shutdown():
            rate.sleep()

if __name__ == '__main__':
    try:
        mc = MainController()
        mc.pub_path()
        mc.spin()

    except KeyboardInterrupt:
        print("Shutting down")