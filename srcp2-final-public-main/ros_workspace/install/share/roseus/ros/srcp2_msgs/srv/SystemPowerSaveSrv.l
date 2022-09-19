;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::SystemPowerSaveSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'SystemPowerSaveSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::SYSTEMPOWERSAVESRV")
  (make-package "SRCP2_MSGS::SYSTEMPOWERSAVESRV"))
(unless (find-package "SRCP2_MSGS::SYSTEMPOWERSAVESRVREQUEST")
  (make-package "SRCP2_MSGS::SYSTEMPOWERSAVESRVREQUEST"))
(unless (find-package "SRCP2_MSGS::SYSTEMPOWERSAVESRVRESPONSE")
  (make-package "SRCP2_MSGS::SYSTEMPOWERSAVESRVRESPONSE"))

(in-package "ROS")





(defclass srcp2_msgs::SystemPowerSaveSrvRequest
  :super ros::object
  :slots (_power_save ))

(defmethod srcp2_msgs::SystemPowerSaveSrvRequest
  (:init
   (&key
    ((:power_save __power_save) nil)
    )
   (send-super :init)
   (setq _power_save __power_save)
   self)
  (:power_save
   (&optional (__power_save :null))
   (if (not (eq __power_save :null)) (setq _power_save __power_save)) _power_save)
  (:serialization-length
   ()
   (+
    ;; bool _power_save
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _power_save
       (if _power_save (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _power_save
     (setq _power_save (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::SystemPowerSaveSrvResponse
  :super ros::object
  :slots (_success _message ))

(defmethod srcp2_msgs::SystemPowerSaveSrvResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass srcp2_msgs::SystemPowerSaveSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::SystemPowerSaveSrv :md5sum-) "7952b3919e8de2c1fd024be9ea064cf1")
(setf (get srcp2_msgs::SystemPowerSaveSrv :datatype-) "srcp2_msgs/SystemPowerSaveSrv")
(setf (get srcp2_msgs::SystemPowerSaveSrv :request) srcp2_msgs::SystemPowerSaveSrvRequest)
(setf (get srcp2_msgs::SystemPowerSaveSrv :response) srcp2_msgs::SystemPowerSaveSrvResponse)

(defmethod srcp2_msgs::SystemPowerSaveSrvRequest
  (:response () (instance srcp2_msgs::SystemPowerSaveSrvResponse :init)))

(setf (get srcp2_msgs::SystemPowerSaveSrvRequest :md5sum-) "7952b3919e8de2c1fd024be9ea064cf1")
(setf (get srcp2_msgs::SystemPowerSaveSrvRequest :datatype-) "srcp2_msgs/SystemPowerSaveSrvRequest")
(setf (get srcp2_msgs::SystemPowerSaveSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
bool power_save
---
bool success
string message
")

(setf (get srcp2_msgs::SystemPowerSaveSrvResponse :md5sum-) "7952b3919e8de2c1fd024be9ea064cf1")
(setf (get srcp2_msgs::SystemPowerSaveSrvResponse :datatype-) "srcp2_msgs/SystemPowerSaveSrvResponse")
(setf (get srcp2_msgs::SystemPowerSaveSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
bool power_save
---
bool success
string message
")



(provide :srcp2_msgs/SystemPowerSaveSrv "7952b3919e8de2c1fd024be9ea064cf1")


