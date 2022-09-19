;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::SpotLightSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'SpotLightSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::SPOTLIGHTSRV")
  (make-package "SRCP2_MSGS::SPOTLIGHTSRV"))
(unless (find-package "SRCP2_MSGS::SPOTLIGHTSRVREQUEST")
  (make-package "SRCP2_MSGS::SPOTLIGHTSRVREQUEST"))
(unless (find-package "SRCP2_MSGS::SPOTLIGHTSRVRESPONSE")
  (make-package "SRCP2_MSGS::SPOTLIGHTSRVRESPONSE"))

(in-package "ROS")





(defclass srcp2_msgs::SpotLightSrvRequest
  :super ros::object
  :slots (_range ))

(defmethod srcp2_msgs::SpotLightSrvRequest
  (:init
   (&key
    ((:range __range) 0.0)
    )
   (send-super :init)
   (setq _range (float __range))
   self)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:serialization-length
   ()
   (+
    ;; float64 _range
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass srcp2_msgs::SpotLightSrvResponse
  :super ros::object
  :slots (_success ))

(defmethod srcp2_msgs::SpotLightSrvResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::SpotLightSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::SpotLightSrv :md5sum-) "e98a2777615dc21bee2bf971bff096b4")
(setf (get srcp2_msgs::SpotLightSrv :datatype-) "srcp2_msgs/SpotLightSrv")
(setf (get srcp2_msgs::SpotLightSrv :request) srcp2_msgs::SpotLightSrvRequest)
(setf (get srcp2_msgs::SpotLightSrv :response) srcp2_msgs::SpotLightSrvResponse)

(defmethod srcp2_msgs::SpotLightSrvRequest
  (:response () (instance srcp2_msgs::SpotLightSrvResponse :init)))

(setf (get srcp2_msgs::SpotLightSrvRequest :md5sum-) "e98a2777615dc21bee2bf971bff096b4")
(setf (get srcp2_msgs::SpotLightSrvRequest :datatype-) "srcp2_msgs/SpotLightSrvRequest")
(setf (get srcp2_msgs::SpotLightSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
#
# Robot spot-light control
#
float64 range
---
bool success
")

(setf (get srcp2_msgs::SpotLightSrvResponse :md5sum-) "e98a2777615dc21bee2bf971bff096b4")
(setf (get srcp2_msgs::SpotLightSrvResponse :datatype-) "srcp2_msgs/SpotLightSrvResponse")
(setf (get srcp2_msgs::SpotLightSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
#
# Robot spot-light control
#
float64 range
---
bool success
")



(provide :srcp2_msgs/SpotLightSrv "e98a2777615dc21bee2bf971bff096b4")


