;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::BrakeRoverSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'BrakeRoverSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::BRAKEROVERSRV")
  (make-package "SRCP2_MSGS::BRAKEROVERSRV"))
(unless (find-package "SRCP2_MSGS::BRAKEROVERSRVREQUEST")
  (make-package "SRCP2_MSGS::BRAKEROVERSRVREQUEST"))
(unless (find-package "SRCP2_MSGS::BRAKEROVERSRVRESPONSE")
  (make-package "SRCP2_MSGS::BRAKEROVERSRVRESPONSE"))

(in-package "ROS")





(defclass srcp2_msgs::BrakeRoverSrvRequest
  :super ros::object
  :slots (_brake_force ))

(defmethod srcp2_msgs::BrakeRoverSrvRequest
  (:init
   (&key
    ((:brake_force __brake_force) 0.0)
    )
   (send-super :init)
   (setq _brake_force (float __brake_force))
   self)
  (:brake_force
   (&optional __brake_force)
   (if __brake_force (setq _brake_force __brake_force)) _brake_force)
  (:serialization-length
   ()
   (+
    ;; float64 _brake_force
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _brake_force
       (sys::poke _brake_force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _brake_force
     (setq _brake_force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass srcp2_msgs::BrakeRoverSrvResponse
  :super ros::object
  :slots (_finished ))

(defmethod srcp2_msgs::BrakeRoverSrvResponse
  (:init
   (&key
    ((:finished __finished) nil)
    )
   (send-super :init)
   (setq _finished __finished)
   self)
  (:finished
   (&optional (__finished :null))
   (if (not (eq __finished :null)) (setq _finished __finished)) _finished)
  (:serialization-length
   ()
   (+
    ;; bool _finished
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finished
       (if _finished (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finished
     (setq _finished (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::BrakeRoverSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::BrakeRoverSrv :md5sum-) "0c30799110874cd224d9a2d9de3215fc")
(setf (get srcp2_msgs::BrakeRoverSrv :datatype-) "srcp2_msgs/BrakeRoverSrv")
(setf (get srcp2_msgs::BrakeRoverSrv :request) srcp2_msgs::BrakeRoverSrvRequest)
(setf (get srcp2_msgs::BrakeRoverSrv :response) srcp2_msgs::BrakeRoverSrvResponse)

(defmethod srcp2_msgs::BrakeRoverSrvRequest
  (:response () (instance srcp2_msgs::BrakeRoverSrvResponse :init)))

(setf (get srcp2_msgs::BrakeRoverSrvRequest :md5sum-) "0c30799110874cd224d9a2d9de3215fc")
(setf (get srcp2_msgs::BrakeRoverSrvRequest :datatype-) "srcp2_msgs/BrakeRoverSrvRequest")
(setf (get srcp2_msgs::BrakeRoverSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
float64 brake_force
---
bool finished
")

(setf (get srcp2_msgs::BrakeRoverSrvResponse :md5sum-) "0c30799110874cd224d9a2d9de3215fc")
(setf (get srcp2_msgs::BrakeRoverSrvResponse :datatype-) "srcp2_msgs/BrakeRoverSrvResponse")
(setf (get srcp2_msgs::BrakeRoverSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
float64 brake_force
---
bool finished
")



(provide :srcp2_msgs/BrakeRoverSrv "0c30799110874cd224d9a2d9de3215fc")


