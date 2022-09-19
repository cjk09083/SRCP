;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::SystemMonitorMsg)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'SystemMonitorMsg (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::SYSTEMMONITORMSG")
  (make-package "SRCP2_MSGS::SYSTEMMONITORMSG"))

(in-package "ROS")
;;//! \htmlinclude SystemMonitorMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*POWER_HEALTH_OK*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*POWER_HEALTH_OK* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_OK* 0)
(intern "*POWER_HEALTH_LOW*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*POWER_HEALTH_LOW* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_LOW* 1)
(intern "*POWER_HEALTH_EMERGENCY*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*POWER_HEALTH_EMERGENCY* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_EMERGENCY* 2)
(intern "*BATTERY_MODE_NO_CHANGE*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_NO_CHANGE* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_NO_CHANGE* 0)
(intern "*BATTERY_MODE_CHARGE_HIGH*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_CHARGE_HIGH* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_HIGH* 1)
(intern "*BATTERY_MODE_CHARGE_NORMAL*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_CHARGE_NORMAL* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_NORMAL* 2)
(intern "*BATTERY_MODE_CHARGE_SLOW*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_CHARGE_SLOW* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_SLOW* 3)
(intern "*BATTERY_MODE_DISCHARGE_HIGH*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_DISCHARGE_HIGH* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_HIGH* 4)
(intern "*BATTERY_MODE_DISCHARGE_NORMAL*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_DISCHARGE_NORMAL* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_NORMAL* 5)
(intern "*BATTERY_MODE_DISCHARGE_SLOW*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_DISCHARGE_SLOW* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_SLOW* 6)
(intern "*BATTERY_MODE_DISCHARGE_CONSERVE*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_DISCHARGE_CONSERVE* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_CONSERVE* 7)
(intern "*BATTERY_MODE_FAST_REPAIR*" (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(shadow '*BATTERY_MODE_FAST_REPAIR* (find-package "SRCP2_MSGS::SYSTEMMONITORMSG"))
(defconstant srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_FAST_REPAIR* 8)

(defun srcp2_msgs::SystemMonitorMsg-to-symbol (const)
  (cond
        ((= const 0) 'srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_OK*)
        ((= const 1) 'srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_LOW*)
        ((= const 2) 'srcp2_msgs::SystemMonitorMsg::*POWER_HEALTH_EMERGENCY*)
        ((= const 0) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_NO_CHANGE*)
        ((= const 1) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_HIGH*)
        ((= const 2) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_NORMAL*)
        ((= const 3) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_CHARGE_SLOW*)
        ((= const 4) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_HIGH*)
        ((= const 5) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_NORMAL*)
        ((= const 6) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_SLOW*)
        ((= const 7) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_DISCHARGE_CONSERVE*)
        ((= const 8) 'srcp2_msgs::SystemMonitorMsg::*BATTERY_MODE_FAST_REPAIR*)
        (t nil)))

(defclass srcp2_msgs::SystemMonitorMsg
  :super ros::object
  :slots (_header _power_health _power_saver _solar_ok _power_demand _battery_mode _power_level _power_rate ))

(defmethod srcp2_msgs::SystemMonitorMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:power_health __power_health) 0)
    ((:power_saver __power_saver) nil)
    ((:solar_ok __solar_ok) nil)
    ((:power_demand __power_demand) nil)
    ((:battery_mode __battery_mode) 0)
    ((:power_level __power_level) 0.0)
    ((:power_rate __power_rate) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _power_health (round __power_health))
   (setq _power_saver __power_saver)
   (setq _solar_ok __solar_ok)
   (setq _power_demand __power_demand)
   (setq _battery_mode (round __battery_mode))
   (setq _power_level (float __power_level))
   (setq _power_rate (float __power_rate))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:power_health
   (&optional __power_health)
   (if __power_health (setq _power_health __power_health)) _power_health)
  (:power_saver
   (&optional (__power_saver :null))
   (if (not (eq __power_saver :null)) (setq _power_saver __power_saver)) _power_saver)
  (:solar_ok
   (&optional (__solar_ok :null))
   (if (not (eq __solar_ok :null)) (setq _solar_ok __solar_ok)) _solar_ok)
  (:power_demand
   (&optional (__power_demand :null))
   (if (not (eq __power_demand :null)) (setq _power_demand __power_demand)) _power_demand)
  (:battery_mode
   (&optional __battery_mode)
   (if __battery_mode (setq _battery_mode __battery_mode)) _battery_mode)
  (:power_level
   (&optional __power_level)
   (if __power_level (setq _power_level __power_level)) _power_level)
  (:power_rate
   (&optional __power_rate)
   (if __power_rate (setq _power_rate __power_rate)) _power_rate)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _power_health
    1
    ;; bool _power_saver
    1
    ;; bool _solar_ok
    1
    ;; bool _power_demand
    1
    ;; int8 _battery_mode
    1
    ;; float32 _power_level
    4
    ;; float32 _power_rate
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _power_health
       (write-byte _power_health s)
     ;; bool _power_saver
       (if _power_saver (write-byte -1 s) (write-byte 0 s))
     ;; bool _solar_ok
       (if _solar_ok (write-byte -1 s) (write-byte 0 s))
     ;; bool _power_demand
       (if _power_demand (write-byte -1 s) (write-byte 0 s))
     ;; int8 _battery_mode
       (write-byte _battery_mode s)
     ;; float32 _power_level
       (sys::poke _power_level (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _power_rate
       (sys::poke _power_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _power_health
     (setq _power_health (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _power_health 127) (setq _power_health (- _power_health 256)))
   ;; bool _power_saver
     (setq _power_saver (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _solar_ok
     (setq _solar_ok (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _power_demand
     (setq _power_demand (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _battery_mode
     (setq _battery_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _battery_mode 127) (setq _battery_mode (- _battery_mode 256)))
   ;; float32 _power_level
     (setq _power_level (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _power_rate
     (setq _power_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get srcp2_msgs::SystemMonitorMsg :md5sum-) "0899aee3520463f46dd413ba6fef2b62")
(setf (get srcp2_msgs::SystemMonitorMsg :datatype-) "srcp2_msgs/SystemMonitorMsg")
(setf (get srcp2_msgs::SystemMonitorMsg :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message allows battery of a robot to communicate how much power is left
#

# Power State Constants
uint8 POWER_HEALTH_OK        = 0
uint8 POWER_HEALTH_LOW       = 1
uint8 POWER_HEALTH_EMERGENCY = 2

# Battery Mode Constants
uint8 BATTERY_MODE_NO_CHANGE       =0
uint8 BATTERY_MODE_CHARGE_HIGH     =1
uint8 BATTERY_MODE_CHARGE_NORMAL   =2
uint8 BATTERY_MODE_CHARGE_SLOW     =3
uint8 BATTERY_MODE_DISCHARGE_HIGH  =4
uint8 BATTERY_MODE_DISCHARGE_NORMAL=5
uint8 BATTERY_MODE_DISCHARGE_SLOW  =6
uint8 BATTERY_MODE_DISCHARGE_CONSERVE  =7
uint8 BATTERY_MODE_FAST_REPAIR     =8


#*************** The message **************
Header  header

int8    power_health    #
bool    power_saver     #
bool    solar_ok        #
bool    power_demand    #
int8    battery_mode    #
float32 power_level     #
float32 power_rate      #

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



(provide :srcp2_msgs/SystemMonitorMsg "0899aee3520463f46dd413ba6fef2b62")


