#!/usr/bin/env python3

import math
import os
import select
import sys
import imutils
import rospy
import rosservice
import tf
import time

from geometry_msgs.msg import Point, Pose, Quaternion, Twist, PoseWithCovarianceStamped, PoseStamped
from nav_msgs.msg import Odometry
from sensor_msgs.msg import LaserScan, Imu, Image, PointCloud2, CompressedImage
from std_msgs.msg import Float64
from tf.transformations import euler_from_quaternion
from darknet_ros_msgs.msg import BoundingBoxes

import sensor_msgs.point_cloud2 as pc2
import numpy as np
import numpy.linalg as lin
import cv2
from cv_bridge import CvBridge, CvBridgeError

if os.name == 'nt':
    import msvcrt
else:
    import tty, termios
station_center, station_y_center, station_width, station_height, station_y, station_x = 0, 0, 0, 0, 0, 0
frame, cal_x, cal_y, distance, center, width_raw, width_kf, slam_check, center_check, err_code = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
plant_center, plant_y_center, plant_width, plant_height, plant_x, plant_y = 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
image_topic = '/small_scout_1/camera/left/image_raw'
mode = 'plant'


def box(data):
    try:
        global station_center, station_y_center, station_width, station_height, station_x, station_y, \
            plant_center, plant_y_center, plant_width, plant_height, plant_x, plant_y

        station_center = 0
        plant_center = 0
        station_y_center = 0

        for box in data.bounding_boxes:
            if box.id == 1:
                station_center = (box.xmax + box.xmin) / 2
                station_y_center = (box.ymax + box.ymin) / 2

                station_x = box.xmin
                station_y = box.ymin
                station_width = box.xmax - box.xmin
                station_height = box.ymax - box.ymin

            elif box.id == 2:
                plant_center = (box.xmax + box.xmin) / 2
                plant_y_center = (box.ymax + box.ymin) / 2

                plant_x = box.xmin
                plant_y = box.ymin
                plant_width = box.xmax - box.xmin
                plant_height = box.ymax - box.ymin
            # break


    except:
        global err_code
        err_code = 4
        print("box except Error")
        pass


def image_callback(msg):
    try:
        if station_center != 0 or plant_center != 0:
            global station_y, station_height, station_x, station_width, \
                plant_y, plant_height, plant_x, plant_width, err_code
            #        frame = frame + 1

            #        if frame % 1 == 0:
            try:
                # Convert your ROS Image message to OpenCV2
                bridge = CvBridge()
                img_raw = bridge.imgmsg_to_cv2(msg, "bgr8")

                if mode == 'station':
                    img = img_raw[station_y: station_y + station_height, station_x: station_x + station_width]
                    bgr_img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
                    hsv_img = cv2.cvtColor(bgr_img, cv2.COLOR_RGB2HSV)
                    lower_orange = (0, 0, 133)
                    upper_orange = (179, 15, 255)

                ################ TEST CODE FOR PLANT ################
                elif mode == 'plant':
                    img = img_raw[plant_y: plant_y + plant_height, plant_x: plant_x + plant_width]
                    bgr_img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
                    hsv_img = cv2.cvtColor(bgr_img, cv2.COLOR_RGB2HSV)
                    lower_orange = (105, 94, 000)
                    upper_orange = (122, 255, 200)

                #####################################################

                thresh = cv2.inRange(hsv_img, lower_orange, upper_orange)

                kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))

                thresh_open = cv2.morphologyEx(thresh, cv2.MORPH_OPEN, kernel)

                (x, y) = (0, 0)

                roi = img[y: y + 360, x: x + 640]

                cnt, _, stats, centroids = cv2.connectedComponentsWithStats(thresh_open)

                a = np.array(stats)

                stats = a.tolist()

                stats.sort(key=lambda n: n[4], reverse=True)

                if cnt == 1:

                    (x, y, w, h, s) = stats[0]

                #     continue

                else:

                    (x, y, w, h, s) = stats[1]

                #     (x1, y1, w1, h1, s1) = stats[2]

                #     (x2, y2, w2, h2, s2) = stats[3]

                if 100 < s < 20000:
                    cv2.rectangle(img, (x, y, w, h), (0, 255, 0), 2)

                    #     cv2.rectangle(img2, (x1, y1, w1, h1), (0, 255, 0), 2)

                    #     cv2.rectangle(img2, (x2, y2, w2, h2), (0, 255, 0), 2)

                    roi = img[y: y + h, x: x + w]

                image_ori = imutils.resize(img, width=640)
                # cv2.imshow("ROI", roi)
                cv2.imshow('ori', img)
                cv2.imshow('ORI_image', image_ori)
                # cv2.imshow('result', thresh)
                cv2.imshow('open_result', thresh_open)
                cv2.waitKey(25)
                # cap.release()
                # cv2.destroyAllWindows()
                # cv2.waitKey(10)
                print("height: ", h)

                if mode == 'station':
                    cal_distance = 858 / h + 3.675
                    print("distance to station : ", cal_distance)

                elif mode == 'plant':
                    cal_distance1 = 612.57 * math.pow(h, -1.1)  # pow
                    print("distance to plant :  %.2f" % cal_distance1)

            # cv2.waitKey('q')
            # except BaseException as e:
            except CvBridgeError as e:
                err_code = 6
                print("image callback except Error_in")
                print(e)
                pass
    except Exception as e:
        err_code = 6
        print("image callback except Error_out : ", e)
        pass


if __name__ == "__main__":
    rospy.init_node('turtlebot3_teleop_6', anonymous=True)
    rospy.Subscriber(image_topic, Image, image_callback)
    rospy.Subscriber('/darknet_ros/bounding_boxes', BoundingBoxes, box)
    rospy.spin()
