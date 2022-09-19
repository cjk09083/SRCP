#!/usr/bin/env python3

# Copyright (c) 2011, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#    * Neither the name of the Willow Garage, Inc. nor the names of its
#      contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import Float64
import math

import sys, select, os

if os.name == 'nt':
    import msvcrt
else:
    import tty, termios

BURGER_MAX_LIN_VEL = 0.22
BURGER_MAX_ANG_VEL = 2.84

WAFFLE_MAX_LIN_VEL = 0.26
WAFFLE_MAX_ANG_VEL = 1.82

LIN_VEL_STEP_SIZE = 0.01
ANG_VEL_STEP_SIZE = 0.1

speed = 10

msg = """
Control Your TurtleBot3!
---------------------------
Moving around:
        w
   a    s    d
        x

w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

space key, s : force stop

CTRL-C to quit
"""

e = """
Communications Failed
"""


def getKey():
    if os.name == 'nt':
        return msvcrt.getch()

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


if __name__ == "__main__":
    if os.name != 'nt':
        settings = termios.tcgetattr(sys.stdin)

    rospy.init_node('turtlebot3_teleop',anonymous=True)

    fl_vel_pub = rospy.Publisher('small_scout_1/front_left_wheel/drive/command/velocity', Float64, queue_size=10)
    fr_vel_pub = rospy.Publisher('small_scout_1/front_right_wheel/drive/command/velocity', Float64, queue_size=10)
    bl_vel_pub = rospy.Publisher('small_scout_1/back_left_wheel/drive/command/velocity', Float64, queue_size=10)
    br_vel_pub = rospy.Publisher('small_scout_1/back_right_wheel/drive/command/velocity', Float64, queue_size=10)
    FR_pub = rospy.Publisher("small_scout_1/front_right_wheel/steer/command/position", Float64, queue_size=10)
    FL_pub = rospy.Publisher("small_scout_1/front_left_wheel/steer/command/position", Float64, queue_size=10)
    BR_pub = rospy.Publisher("small_scout_1/back_right_wheel/steer/command/position", Float64, queue_size=10)
    BL_pub = rospy.Publisher("small_scout_1/back_left_wheel/steer/command/position", Float64, queue_size=10)

    fr_float64 = 0
    fl_float64 = 0
    br_float64 = 0
    bl_float64 = 0

    status = 0
    target_linear_vel = 0.0
    target_angular_vel = 0.0
    control_linear_vel = 0.0
    control_angular_vel = 0.0

    speed = math.pi * 2

    turn_ratio = 0.5

    fl_vel = 0
    fr_vel = 0
    bl_vel = 0
    br_vel = 0

    try:
        print(msg)
        while (1):
            key = getKey()
            if key == 'w':
                fl_vel = speed
                fr_vel = speed
                bl_vel = speed
                br_vel = speed
                fr_float64 = 0
                fl_float64 = 0
                br_float64 = 0
                bl_float64 = 0
                print("go : ", speed)
            elif key == 'x':
                fl_vel = -speed
                fr_vel = -speed
                bl_vel = -speed
                br_vel = -speed
                fr_float64 = 0
                fl_float64 = 0
                br_float64 = 0
                bl_float64 = 0
                print("back : ", speed)
            elif key == 'a':
                fl_vel = speed * turn_ratio
                fr_vel = -speed * turn_ratio
                bl_vel = speed * turn_ratio
                br_vel = -speed * turn_ratio
                fr_float64 = math.pi / 4
                fl_float64 = - math.pi / 4
                br_float64 = - math.pi / 4
                bl_float64 = math.pi / 4
                print("left : ", speed)
            elif key == 'd':
                fl_vel = -speed * turn_ratio
                fr_vel = speed * turn_ratio
                bl_vel = -speed * turn_ratio
                br_vel = speed * turn_ratio
                fr_float64 = math.pi / 4
                fl_float64 = - math.pi / 4
                br_float64 = - math.pi / 4
                bl_float64 = math.pi / 4
                print("right : ", speed)
            elif key == 'o':
                speed = speed - 0.1
                fl_vel = speed
                fr_vel = speed
                bl_vel = speed
                br_vel = speed
                print("speed down : ", speed)
            elif key == 'p':
                speed = speed + 0.1
                fl_vel = speed
                fr_vel = speed
                bl_vel = speed
                br_vel = speed
                print("speed down : ", speed)
            elif key == ' ' or key == 's':
                fl_vel = 0
                fr_vel = 0
                bl_vel = 0
                br_vel = 0
                fr_float64 = 0
                fl_float64 = 0
                br_float64 = 0
                bl_float64 = 0
                print("stop : ", speed)
            else:
                if (key == '\x03'):
                    break

            if status == 20:
                print(msg)
                status = 0

            fr_vel_pub.publish(fl_vel)
            fl_vel_pub.publish(fr_vel)
            br_vel_pub.publish(bl_vel)
            bl_vel_pub.publish(br_vel)
            FR_pub.publish(fr_float64)
            FL_pub.publish(fl_float64)
            BR_pub.publish(br_float64)
            BL_pub.publish(bl_float64)

    except:
        print(e)

    finally:
        print("final test")
    if os.name != 'nt':
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
