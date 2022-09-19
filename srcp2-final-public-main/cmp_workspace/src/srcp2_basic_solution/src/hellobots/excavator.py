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
from numpy import random

import rospy
from std_msgs.msg import Float64

def main():
    print("Basic Example Python Project: Excavator")
    fl_vel_pub = rospy.Publisher('small_excavator_1/front_left_wheel/drive/command/velocity', Float64, queue_size=10)
    fr_vel_pub = rospy.Publisher('small_excavator_1/front_right_wheel/drive/command/velocity', Float64, queue_size=10)
    bl_vel_pub = rospy.Publisher('small_excavator_1/back_left_wheel/drive/command/velocity', Float64, queue_size=10)
    br_vel_pub = rospy.Publisher('small_excavator_1/back_right_wheel/drive/command/velocity', Float64, queue_size=10)
    arm_pub    = rospy.Publisher('small_excavator_1/arm/shoulder_pitch/command/position', Float64, queue_size=10)
    elb_pub    = rospy.Publisher('small_excavator_1/arm/elbow_pitch/command/position', Float64, queue_size=10)
    wrst_pub   = rospy.Publisher('small_excavator_1/arm/wrist_pitch/command/position', Float64, queue_size=10)
    
    
    speed = 2.0
    arm  = 0.0
    elb  = 0.0
    wrst = 0.0

    rospy.init_node('demoscout', anonymous=True)
    rate = rospy.Rate(0.5) # Every 2 Seconds
    
    arm_pub.publish(0)
    elb_pub.publish(0)
    wrst_pub.publish(0)
    


    while not rospy.is_shutdown():
        fr_vel_pub.publish(speed)
        fl_vel_pub.publish(speed)
        br_vel_pub.publish(speed)
        bl_vel_pub.publish(speed)
        arm_pub.publish(arm)
        elb_pub.publish(elb)
        wrst_pub.publish(wrst)
        
        print(f"Sending Velocity Command to all wheels :[ {speed:8} ]")
        print(f"Sending Shoulder Postion Command       :[ {arm:8.3f} ]")
        print(f"Sending Elbow Postion Command          :[ {elb:8.3f} ]")
        print(f"Sending Wrist Postion Command          :[ {wrst:8.3f} ]")
        speed=speed*-1.0
        arm = -2.0+random.rand()*3.1415926
        elb = 0.0+random.rand()*3.1415926/2
        wrst = -elb

        rate.sleep()

if __name__ == "__main__":
    main()