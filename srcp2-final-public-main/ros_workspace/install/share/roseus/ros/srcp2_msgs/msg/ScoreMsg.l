;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::ScoreMsg)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'ScoreMsg (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::SCOREMSG")
  (make-package "SRCP2_MSGS::SCOREMSG"))

(in-package "ROS")
;;//! \htmlinclude ScoreMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass srcp2_msgs::ScoreMsg
  :super ros::object
  :slots (_header _score _hauler_volatile_score _types_collected _masses_collected_kg ))

(defmethod srcp2_msgs::ScoreMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:score __score) 0.0)
    ((:hauler_volatile_score __hauler_volatile_score) 0.0)
    ((:types_collected __types_collected) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:masses_collected_kg __masses_collected_kg) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _score (float __score))
   (setq _hauler_volatile_score (float __hauler_volatile_score))
   (setq _types_collected __types_collected)
   (setq _masses_collected_kg __masses_collected_kg)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:hauler_volatile_score
   (&optional __hauler_volatile_score)
   (if __hauler_volatile_score (setq _hauler_volatile_score __hauler_volatile_score)) _hauler_volatile_score)
  (:types_collected
   (&optional __types_collected)
   (if __types_collected (setq _types_collected __types_collected)) _types_collected)
  (:masses_collected_kg
   (&optional __masses_collected_kg)
   (if __masses_collected_kg (setq _masses_collected_kg __masses_collected_kg)) _masses_collected_kg)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _score
    8
    ;; float64 _hauler_volatile_score
    8
    ;; string[] _types_collected
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _types_collected)) 4
    ;; float64[] _masses_collected_kg
    (* 8    (length _masses_collected_kg)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _score
       (sys::poke _score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hauler_volatile_score
       (sys::poke _hauler_volatile_score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string[] _types_collected
     (write-long (length _types_collected) s)
     (dolist (elem _types_collected)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _masses_collected_kg
     (write-long (length _masses_collected_kg) s)
     (dotimes (i (length _masses_collected_kg))
       (sys::poke (elt _masses_collected_kg i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hauler_volatile_score
     (setq _hauler_volatile_score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string[] _types_collected
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _types_collected (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _types_collected i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _masses_collected_kg
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _masses_collected_kg (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _masses_collected_kg i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get srcp2_msgs::ScoreMsg :md5sum-) "d717730154f875f7091c54cda3c9ac8e")
(setf (get srcp2_msgs::ScoreMsg :datatype-) "srcp2_msgs/ScoreMsg")
(setf (get srcp2_msgs::ScoreMsg :definition-)
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

# scoring data
float64 score # the current total score for this sim
float64 hauler_volatile_score # the score of all the volatiles currently held in hauler bins (tie-breaker #1)

# collection data (indexes align) -- this is for competitor information and used in tie-breaking
string[] types_collected      # which types have been collected to date?
float64[] masses_collected_kg # how much each type?
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



(provide :srcp2_msgs/ScoreMsg "d717730154f875f7091c54cda3c9ac8e")


