#!/usr/bin/env python3
"""
 +---------------------------------------------------------------------------+
 | Space Robotics Simulation2                                                |
 | Copyright (c) 2020, NASA-JSC, All Rights Reserved                         |
 | Unauthorized distribution strictly prohibited                             |
 +---------------------------------------------------------------------------+
"""
import sys
import os

import numpy as np

import rospy
from std_msgs.msg import Float64

def main():
    print("Basic Example Python Project: Scout")
    fl_vel_pub = rospy.Publisher('small_scout_1/front_left_wheel/drive/command/velocity', Float64, queue_size=10)
    fr_vel_pub = rospy.Publisher('small_scout_1/front_right_wheel/drive/command/velocity', Float64, queue_size=10)
    bl_vel_pub = rospy.Publisher('small_scout_1/back_left_wheel/drive/command/velocity', Float64, queue_size=10)
    br_vel_pub = rospy.Publisher('small_scout_1/back_right_wheel/drive/command/velocity', Float64, queue_size=10)
    rospy.init_node('demoscout', anonymous=True)
    rate = rospy.Rate(0.25) # Every 4 Seconds
    wheels_drive_command = Float64()
    speed = 100.0
    while not rospy.is_shutdown():
        fr_vel_pub.publish(speed)
        fl_vel_pub.publish(speed)
        br_vel_pub.publish(speed)
        bl_vel_pub.publish(speed)
        print(f"Sending Velocity Command to all wheels :[ {speed:8} ]")
        speed=speed*-1.0

        rate.sleep()

if __name__ == "__main__":
    main()