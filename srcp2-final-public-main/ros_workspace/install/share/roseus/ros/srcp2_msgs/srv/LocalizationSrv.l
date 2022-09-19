;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::LocalizationSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'LocalizationSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::LOCALIZATIONSRV")
  (make-package "SRCP2_MSGS::LOCALIZATIONSRV"))
(unless (find-package "SRCP2_MSGS::LOCALIZATIONSRVREQUEST")
  (make-package "SRCP2_MSGS::LOCALIZATIONSRVREQUEST"))
(unless (find-package "SRCP2_MSGS::LOCALIZATIONSRVRESPONSE")
  (make-package "SRCP2_MSGS::LOCALIZATIONSRVRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass srcp2_msgs::LocalizationSrvRequest
  :super ros::object
  :slots (_call ))

(defmethod srcp2_msgs::LocalizationSrvRequest
  (:init
   (&key
    ((:call __call) nil)
    )
   (send-super :init)
   (setq _call __call)
   self)
  (:call
   (&optional (__call :null))
   (if (not (eq __call :null)) (setq _call __call)) _call)
  (:serialization-length
   ()
   (+
    ;; bool _call
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _call
       (if _call (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _call
     (setq _call (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::LocalizationSrvResponse
  :super ros::object
  :slots (_pose ))

(defmethod srcp2_msgs::LocalizationSrvResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass srcp2_msgs::LocalizationSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::LocalizationSrv :md5sum-) "c102a4afb0b376754d6cb558ea05ea03")
(setf (get srcp2_msgs::LocalizationSrv :datatype-) "srcp2_msgs/LocalizationSrv")
(setf (get srcp2_msgs::LocalizationSrv :request) srcp2_msgs::LocalizationSrvRequest)
(setf (get srcp2_msgs::LocalizationSrv :response) srcp2_msgs::LocalizationSrvResponse)

(defmethod srcp2_msgs::LocalizationSrvRequest
  (:response () (instance srcp2_msgs::LocalizationSrvResponse :init)))

(setf (get srcp2_msgs::LocalizationSrvRequest :md5sum-) "c102a4afb0b376754d6cb558ea05ea03")
(setf (get srcp2_msgs::LocalizationSrvRequest :datatype-) "srcp2_msgs/LocalizationSrvRequest")
(setf (get srcp2_msgs::LocalizationSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# Service message for getting rover absolute position
#
bool call
---
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get srcp2_msgs::LocalizationSrvResponse :md5sum-) "c102a4afb0b376754d6cb558ea05ea03")
(setf (get srcp2_msgs::LocalizationSrvResponse :datatype-) "srcp2_msgs/LocalizationSrvResponse")
(setf (get srcp2_msgs::LocalizationSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# Service message for getting rover absolute position
#
bool call
---
geometry_msgs/Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :srcp2_msgs/LocalizationSrv "c102a4afb0b376754d6cb558ea05ea03")


