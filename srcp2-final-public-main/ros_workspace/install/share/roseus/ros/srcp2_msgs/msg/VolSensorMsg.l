;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::VolSensorMsg)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'VolSensorMsg (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::VOLSENSORMSG")
  (make-package "SRCP2_MSGS::VOLSENSORMSG"))

(in-package "ROS")
;;//! \htmlinclude VolSensorMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass srcp2_msgs::VolSensorMsg
  :super ros::object
  :slots (_header _vol_type _distance_to ))

(defmethod srcp2_msgs::VolSensorMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vol_type __vol_type) "")
    ((:distance_to __distance_to) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vol_type (string __vol_type))
   (setq _distance_to (float __distance_to))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vol_type
   (&optional __vol_type)
   (if __vol_type (setq _vol_type __vol_type)) _vol_type)
  (:distance_to
   (&optional __distance_to)
   (if __distance_to (setq _distance_to __distance_to)) _distance_to)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _vol_type
    4 (length _vol_type)
    ;; float32 _distance_to
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _vol_type
       (write-long (length _vol_type) s) (princ _vol_type s)
     ;; float32 _distance_to
       (sys::poke _distance_to (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _vol_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vol_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _distance_to
     (setq _distance_to (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get srcp2_msgs::VolSensorMsg :md5sum-) "79d667cc3950eac40bb1e3adee91ec19")
(setf (get srcp2_msgs::VolSensorMsg :datatype-) "srcp2_msgs/VolSensorMsg")
(setf (get srcp2_msgs::VolSensorMsg :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019-2020, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# Volatile Sensor query message.
#
Header      header
string      vol_type         # the type name string
float32     distance_to      # absolute distance from sensor to volatile (meters)
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :srcp2_msgs/VolSensorMsg "79d667cc3950eac40bb1e3adee91ec19")


