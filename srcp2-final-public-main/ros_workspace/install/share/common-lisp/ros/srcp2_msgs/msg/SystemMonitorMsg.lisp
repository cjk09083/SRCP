; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-msg)


;//! \htmlinclude SystemMonitorMsg.msg.html

(cl:defclass <SystemMonitorMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (power_health
    :reader power_health
    :initarg :power_health
    :type cl:fixnum
    :initform 0)
   (power_saver
    :reader power_saver
    :initarg :power_saver
    :type cl:boolean
    :initform cl:nil)
   (solar_ok
    :reader solar_ok
    :initarg :solar_ok
    :type cl:boolean
    :initform cl:nil)
   (power_demand
    :reader power_demand
    :initarg :power_demand
    :type cl:boolean
    :initform cl:nil)
   (battery_mode
    :reader battery_mode
    :initarg :battery_mode
    :type cl:fixnum
    :initform 0)
   (power_level
    :reader power_level
    :initarg :power_level
    :type cl:float
    :initform 0.0)
   (power_rate
    :reader power_rate
    :initarg :power_rate
    :type cl:float
    :initform 0.0))
)

(cl:defclass SystemMonitorMsg (<SystemMonitorMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SystemMonitorMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SystemMonitorMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-msg:<SystemMonitorMsg> is deprecated: use srcp2_msgs-msg:SystemMonitorMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:header-val is deprecated.  Use srcp2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'power_health-val :lambda-list '(m))
(cl:defmethod power_health-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:power_health-val is deprecated.  Use srcp2_msgs-msg:power_health instead.")
  (power_health m))

(cl:ensure-generic-function 'power_saver-val :lambda-list '(m))
(cl:defmethod power_saver-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:power_saver-val is deprecated.  Use srcp2_msgs-msg:power_saver instead.")
  (power_saver m))

(cl:ensure-generic-function 'solar_ok-val :lambda-list '(m))
(cl:defmethod solar_ok-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:solar_ok-val is deprecated.  Use srcp2_msgs-msg:solar_ok instead.")
  (solar_ok m))

(cl:ensure-generic-function 'power_demand-val :lambda-list '(m))
(cl:defmethod power_demand-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:power_demand-val is deprecated.  Use srcp2_msgs-msg:power_demand instead.")
  (power_demand m))

(cl:ensure-generic-function 'battery_mode-val :lambda-list '(m))
(cl:defmethod battery_mode-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:battery_mode-val is deprecated.  Use srcp2_msgs-msg:battery_mode instead.")
  (battery_mode m))

(cl:ensure-generic-function 'power_level-val :lambda-list '(m))
(cl:defmethod power_level-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:power_level-val is deprecated.  Use srcp2_msgs-msg:power_level instead.")
  (power_level m))

(cl:ensure-generic-function 'power_rate-val :lambda-list '(m))
(cl:defmethod power_rate-val ((m <SystemMonitorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:power_rate-val is deprecated.  Use srcp2_msgs-msg:power_rate instead.")
  (power_rate m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SystemMonitorMsg>)))
    "Constants for message type '<SystemMonitorMsg>"
  '((:POWER_HEALTH_OK . 0)
    (:POWER_HEALTH_LOW . 1)
    (:POWER_HEALTH_EMERGENCY . 2)
    (:BATTERY_MODE_NO_CHANGE . 0)
    (:BATTERY_MODE_CHARGE_HIGH . 1)
    (:BATTERY_MODE_CHARGE_NORMAL . 2)
    (:BATTERY_MODE_CHARGE_SLOW . 3)
    (:BATTERY_MODE_DISCHARGE_HIGH . 4)
    (:BATTERY_MODE_DISCHARGE_NORMAL . 5)
    (:BATTERY_MODE_DISCHARGE_SLOW . 6)
    (:BATTERY_MODE_DISCHARGE_CONSERVE . 7)
    (:BATTERY_MODE_FAST_REPAIR . 8))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SystemMonitorMsg)))
    "Constants for message type 'SystemMonitorMsg"
  '((:POWER_HEALTH_OK . 0)
    (:POWER_HEALTH_LOW . 1)
    (:POWER_HEALTH_EMERGENCY . 2)
    (:BATTERY_MODE_NO_CHANGE . 0)
    (:BATTERY_MODE_CHARGE_HIGH . 1)
    (:BATTERY_MODE_CHARGE_NORMAL . 2)
    (:BATTERY_MODE_CHARGE_SLOW . 3)
    (:BATTERY_MODE_DISCHARGE_HIGH . 4)
    (:BATTERY_MODE_DISCHARGE_NORMAL . 5)
    (:BATTERY_MODE_DISCHARGE_SLOW . 6)
    (:BATTERY_MODE_DISCHARGE_CONSERVE . 7)
    (:BATTERY_MODE_FAST_REPAIR . 8))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SystemMonitorMsg>) ostream)
  "Serializes a message object of type '<SystemMonitorMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'power_health)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_saver) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'solar_ok) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_demand) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'battery_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'power_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'power_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SystemMonitorMsg>) istream)
  "Deserializes a message object of type '<SystemMonitorMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'power_health) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'power_saver) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'solar_ok) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'power_demand) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'battery_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_level) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_rate) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SystemMonitorMsg>)))
  "Returns string type for a message object of type '<SystemMonitorMsg>"
  "srcp2_msgs/SystemMonitorMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemMonitorMsg)))
  "Returns string type for a message object of type 'SystemMonitorMsg"
  "srcp2_msgs/SystemMonitorMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SystemMonitorMsg>)))
  "Returns md5sum for a message object of type '<SystemMonitorMsg>"
  "0899aee3520463f46dd413ba6fef2b62")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SystemMonitorMsg)))
  "Returns md5sum for a message object of type 'SystemMonitorMsg"
  "0899aee3520463f46dd413ba6fef2b62")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SystemMonitorMsg>)))
  "Returns full string definition for message of type '<SystemMonitorMsg>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message allows battery of a robot to communicate how much power is left~%#~%~%# Power State Constants~%uint8 POWER_HEALTH_OK        = 0~%uint8 POWER_HEALTH_LOW       = 1~%uint8 POWER_HEALTH_EMERGENCY = 2~%~%# Battery Mode Constants~%uint8 BATTERY_MODE_NO_CHANGE       =0~%uint8 BATTERY_MODE_CHARGE_HIGH     =1~%uint8 BATTERY_MODE_CHARGE_NORMAL   =2~%uint8 BATTERY_MODE_CHARGE_SLOW     =3~%uint8 BATTERY_MODE_DISCHARGE_HIGH  =4~%uint8 BATTERY_MODE_DISCHARGE_NORMAL=5~%uint8 BATTERY_MODE_DISCHARGE_SLOW  =6~%uint8 BATTERY_MODE_DISCHARGE_CONSERVE  =7~%uint8 BATTERY_MODE_FAST_REPAIR     =8~%~%~%#*************** The message **************~%Header  header~%~%int8    power_health    #~%bool    power_saver     #~%bool    solar_ok        #~%bool    power_demand    #~%int8    battery_mode    #~%float32 power_level     #~%float32 power_rate      #~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SystemMonitorMsg)))
  "Returns full string definition for message of type 'SystemMonitorMsg"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message allows battery of a robot to communicate how much power is left~%#~%~%# Power State Constants~%uint8 POWER_HEALTH_OK        = 0~%uint8 POWER_HEALTH_LOW       = 1~%uint8 POWER_HEALTH_EMERGENCY = 2~%~%# Battery Mode Constants~%uint8 BATTERY_MODE_NO_CHANGE       =0~%uint8 BATTERY_MODE_CHARGE_HIGH     =1~%uint8 BATTERY_MODE_CHARGE_NORMAL   =2~%uint8 BATTERY_MODE_CHARGE_SLOW     =3~%uint8 BATTERY_MODE_DISCHARGE_HIGH  =4~%uint8 BATTERY_MODE_DISCHARGE_NORMAL=5~%uint8 BATTERY_MODE_DISCHARGE_SLOW  =6~%uint8 BATTERY_MODE_DISCHARGE_CONSERVE  =7~%uint8 BATTERY_MODE_FAST_REPAIR     =8~%~%~%#*************** The message **************~%Header  header~%~%int8    power_health    #~%bool    power_saver     #~%bool    solar_ok        #~%bool    power_demand    #~%int8    battery_mode    #~%float32 power_level     #~%float32 power_rate      #~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SystemMonitorMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SystemMonitorMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SystemMonitorMsg
    (cl:cons ':header (header msg))
    (cl:cons ':power_health (power_health msg))
    (cl:cons ':power_saver (power_saver msg))
    (cl:cons ':solar_ok (solar_ok msg))
    (cl:cons ':power_demand (power_demand msg))
    (cl:cons ':battery_mode (battery_mode msg))
    (cl:cons ':power_level (power_level msg))
    (cl:cons ':power_rate (power_rate msg))
))
