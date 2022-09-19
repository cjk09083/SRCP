;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::BatteryStateMsg)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'BatteryStateMsg (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::BATTERYSTATEMSG")
  (make-package "SRCP2_MSGS::BATTERYSTATEMSG"))

(in-package "ROS")
;;//! \htmlinclude BatteryStateMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass srcp2_msgs::BatteryStateMsg
  :super ros::object
  :slots (_header _max_capacity_watt_hours _max_discharge_rate_watts _current_capacity_watt_hours _current_consumption_watts _safe_mode_avail_frac _safe_mode_percent _shutdown_percent _mode _overload _number_of_connections ))

(defmethod srcp2_msgs::BatteryStateMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:max_capacity_watt_hours __max_capacity_watt_hours) 0.0)
    ((:max_discharge_rate_watts __max_discharge_rate_watts) 0.0)
    ((:current_capacity_watt_hours __current_capacity_watt_hours) 0.0)
    ((:current_consumption_watts __current_consumption_watts) 0.0)
    ((:safe_mode_avail_frac __safe_mode_avail_frac) 0.0)
    ((:safe_mode_percent __safe_mode_percent) 0.0)
    ((:shutdown_percent __shutdown_percent) 0.0)
    ((:mode __mode) 0)
    ((:overload __overload) 0)
    ((:number_of_connections __number_of_connections) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _max_capacity_watt_hours (float __max_capacity_watt_hours))
   (setq _max_discharge_rate_watts (float __max_discharge_rate_watts))
   (setq _current_capacity_watt_hours (float __current_capacity_watt_hours))
   (setq _current_consumption_watts (float __current_consumption_watts))
   (setq _safe_mode_avail_frac (float __safe_mode_avail_frac))
   (setq _safe_mode_percent (float __safe_mode_percent))
   (setq _shutdown_percent (float __shutdown_percent))
   (setq _mode (round __mode))
   (setq _overload (round __overload))
   (setq _number_of_connections (round __number_of_connections))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:max_capacity_watt_hours
   (&optional __max_capacity_watt_hours)
   (if __max_capacity_watt_hours (setq _max_capacity_watt_hours __max_capacity_watt_hours)) _max_capacity_watt_hours)
  (:max_discharge_rate_watts
   (&optional __max_discharge_rate_watts)
   (if __max_discharge_rate_watts (setq _max_discharge_rate_watts __max_discharge_rate_watts)) _max_discharge_rate_watts)
  (:current_capacity_watt_hours
   (&optional __current_capacity_watt_hours)
   (if __current_capacity_watt_hours (setq _current_capacity_watt_hours __current_capacity_watt_hours)) _current_capacity_watt_hours)
  (:current_consumption_watts
   (&optional __current_consumption_watts)
   (if __current_consumption_watts (setq _current_consumption_watts __current_consumption_watts)) _current_consumption_watts)
  (:safe_mode_avail_frac
   (&optional __safe_mode_avail_frac)
   (if __safe_mode_avail_frac (setq _safe_mode_avail_frac __safe_mode_avail_frac)) _safe_mode_avail_frac)
  (:safe_mode_percent
   (&optional __safe_mode_percent)
   (if __safe_mode_percent (setq _safe_mode_percent __safe_mode_percent)) _safe_mode_percent)
  (:shutdown_percent
   (&optional __shutdown_percent)
   (if __shutdown_percent (setq _shutdown_percent __shutdown_percent)) _shutdown_percent)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:overload
   (&optional __overload)
   (if __overload (setq _overload __overload)) _overload)
  (:number_of_connections
   (&optional __number_of_connections)
   (if __number_of_connections (setq _number_of_connections __number_of_connections)) _number_of_connections)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _max_capacity_watt_hours
    4
    ;; float32 _max_discharge_rate_watts
    4
    ;; float32 _current_capacity_watt_hours
    4
    ;; float32 _current_consumption_watts
    4
    ;; float32 _safe_mode_avail_frac
    4
    ;; float32 _safe_mode_percent
    4
    ;; float32 _shutdown_percent
    4
    ;; int32 _mode
    4
    ;; int32 _overload
    4
    ;; int32 _number_of_connections
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _max_capacity_watt_hours
       (sys::poke _max_capacity_watt_hours (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_discharge_rate_watts
       (sys::poke _max_discharge_rate_watts (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_capacity_watt_hours
       (sys::poke _current_capacity_watt_hours (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_consumption_watts
       (sys::poke _current_consumption_watts (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _safe_mode_avail_frac
       (sys::poke _safe_mode_avail_frac (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _safe_mode_percent
       (sys::poke _safe_mode_percent (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _shutdown_percent
       (sys::poke _shutdown_percent (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _mode
       (write-long _mode s)
     ;; int32 _overload
       (write-long _overload s)
     ;; int32 _number_of_connections
       (write-long _number_of_connections s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _max_capacity_watt_hours
     (setq _max_capacity_watt_hours (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_discharge_rate_watts
     (setq _max_discharge_rate_watts (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_capacity_watt_hours
     (setq _current_capacity_watt_hours (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_consumption_watts
     (setq _current_consumption_watts (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _safe_mode_avail_frac
     (setq _safe_mode_avail_frac (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _safe_mode_percent
     (setq _safe_mode_percent (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _shutdown_percent
     (setq _shutdown_percent (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _overload
     (setq _overload (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _number_of_connections
     (setq _number_of_connections (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get srcp2_msgs::BatteryStateMsg :md5sum-) "6d06a9dfb08ec8e2eec28de188121f4b")
(setf (get srcp2_msgs::BatteryStateMsg :datatype-) "srcp2_msgs/BatteryStateMsg")
(setf (get srcp2_msgs::BatteryStateMsg :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message allows battery of a robot to communicate how much power is left
#

Header  header

float32 max_capacity_watt_hours         # maximum capacity of the battery
float32 max_discharge_rate_watts        # maximum total number of instantaneous watts available
float32 current_capacity_watt_hours     # current capacity of the battery
float32 current_consumption_watts       # current power consumption in watts
float32 safe_mode_avail_frac            # fraction of power available in safe mode
float32 safe_mode_percent               # power level at which rover functionality is limited
float32 shutdown_percent                # power level at which rover functionality is halted
int32 mode                              # mode of the battery, 0 = fully_operation, 1 = power_saving_mode, 2 = emergency_shutdown
int32 overload                          # 0 = no overload, 1 = overload
int32 number_of_connections             # number of consumers

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



(provide :srcp2_msgs/BatteryStateMsg "6d06a9dfb08ec8e2eec28de188121f4b")


