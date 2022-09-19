;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::ExcavatorScoopMsg)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'ExcavatorScoopMsg (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::EXCAVATORSCOOPMSG")
  (make-package "SRCP2_MSGS::EXCAVATORSCOOPMSG"))

(in-package "ROS")
;;//! \htmlinclude ExcavatorScoopMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass srcp2_msgs::ExcavatorScoopMsg
  :super ros::object
  :slots (_header _volatile_clod_mass _regolith_clod_mass ))

(defmethod srcp2_msgs::ExcavatorScoopMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:volatile_clod_mass __volatile_clod_mass) nil)
    ((:regolith_clod_mass __regolith_clod_mass) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _volatile_clod_mass __volatile_clod_mass)
   (setq _regolith_clod_mass __regolith_clod_mass)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:volatile_clod_mass
   (&optional (__volatile_clod_mass :null))
   (if (not (eq __volatile_clod_mass :null)) (setq _volatile_clod_mass __volatile_clod_mass)) _volatile_clod_mass)
  (:regolith_clod_mass
   (&optional (__regolith_clod_mass :null))
   (if (not (eq __regolith_clod_mass :null)) (setq _regolith_clod_mass __regolith_clod_mass)) _regolith_clod_mass)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _volatile_clod_mass
    1
    ;; bool _regolith_clod_mass
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _volatile_clod_mass
       (if _volatile_clod_mass (write-byte -1 s) (write-byte 0 s))
     ;; bool _regolith_clod_mass
       (if _regolith_clod_mass (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _volatile_clod_mass
     (setq _volatile_clod_mass (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _regolith_clod_mass
     (setq _regolith_clod_mass (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get srcp2_msgs::ExcavatorScoopMsg :md5sum-) "218c9d9ac34cff7d7bc66c14b96e45df")
(setf (get srcp2_msgs::ExcavatorScoopMsg :datatype-) "srcp2_msgs/ExcavatorScoopMsg")
(setf (get srcp2_msgs::ExcavatorScoopMsg :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2021, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message publishes the current score, and volatile collection state
# for this simulation
#
Header header

# scoop data
bool volatile_clod_mass # is volatile mass in scoop
bool regolith_clod_mass # is regolith mass in scoop
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



(provide :srcp2_msgs/ExcavatorScoopMsg "218c9d9ac34cff7d7bc66c14b96e45df")


