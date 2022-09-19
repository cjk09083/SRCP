; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-msg)


;//! \htmlinclude BatteryStateMsg.msg.html

(cl:defclass <BatteryStateMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (max_capacity_watt_hours
    :reader max_capacity_watt_hours
    :initarg :max_capacity_watt_hours
    :type cl:float
    :initform 0.0)
   (max_discharge_rate_watts
    :reader max_discharge_rate_watts
    :initarg :max_discharge_rate_watts
    :type cl:float
    :initform 0.0)
   (current_capacity_watt_hours
    :reader current_capacity_watt_hours
    :initarg :current_capacity_watt_hours
    :type cl:float
    :initform 0.0)
   (current_consumption_watts
    :reader current_consumption_watts
    :initarg :current_consumption_watts
    :type cl:float
    :initform 0.0)
   (safe_mode_avail_frac
    :reader safe_mode_avail_frac
    :initarg :safe_mode_avail_frac
    :type cl:float
    :initform 0.0)
   (safe_mode_percent
    :reader safe_mode_percent
    :initarg :safe_mode_percent
    :type cl:float
    :initform 0.0)
   (shutdown_percent
    :reader shutdown_percent
    :initarg :shutdown_percent
    :type cl:float
    :initform 0.0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (overload
    :reader overload
    :initarg :overload
    :type cl:integer
    :initform 0)
   (number_of_connections
    :reader number_of_connections
    :initarg :number_of_connections
    :type cl:integer
    :initform 0))
)

(cl:defclass BatteryStateMsg (<BatteryStateMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryStateMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryStateMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-msg:<BatteryStateMsg> is deprecated: use srcp2_msgs-msg:BatteryStateMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:header-val is deprecated.  Use srcp2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'max_capacity_watt_hours-val :lambda-list '(m))
(cl:defmethod max_capacity_watt_hours-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:max_capacity_watt_hours-val is deprecated.  Use srcp2_msgs-msg:max_capacity_watt_hours instead.")
  (max_capacity_watt_hours m))

(cl:ensure-generic-function 'max_discharge_rate_watts-val :lambda-list '(m))
(cl:defmethod max_discharge_rate_watts-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:max_discharge_rate_watts-val is deprecated.  Use srcp2_msgs-msg:max_discharge_rate_watts instead.")
  (max_discharge_rate_watts m))

(cl:ensure-generic-function 'current_capacity_watt_hours-val :lambda-list '(m))
(cl:defmethod current_capacity_watt_hours-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:current_capacity_watt_hours-val is deprecated.  Use srcp2_msgs-msg:current_capacity_watt_hours instead.")
  (current_capacity_watt_hours m))

(cl:ensure-generic-function 'current_consumption_watts-val :lambda-list '(m))
(cl:defmethod current_consumption_watts-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:current_consumption_watts-val is deprecated.  Use srcp2_msgs-msg:current_consumption_watts instead.")
  (current_consumption_watts m))

(cl:ensure-generic-function 'safe_mode_avail_frac-val :lambda-list '(m))
(cl:defmethod safe_mode_avail_frac-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:safe_mode_avail_frac-val is deprecated.  Use srcp2_msgs-msg:safe_mode_avail_frac instead.")
  (safe_mode_avail_frac m))

(cl:ensure-generic-function 'safe_mode_percent-val :lambda-list '(m))
(cl:defmethod safe_mode_percent-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:safe_mode_percent-val is deprecated.  Use srcp2_msgs-msg:safe_mode_percent instead.")
  (safe_mode_percent m))

(cl:ensure-generic-function 'shutdown_percent-val :lambda-list '(m))
(cl:defmethod shutdown_percent-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:shutdown_percent-val is deprecated.  Use srcp2_msgs-msg:shutdown_percent instead.")
  (shutdown_percent m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:mode-val is deprecated.  Use srcp2_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'overload-val :lambda-list '(m))
(cl:defmethod overload-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:overload-val is deprecated.  Use srcp2_msgs-msg:overload instead.")
  (overload m))

(cl:ensure-generic-function 'number_of_connections-val :lambda-list '(m))
(cl:defmethod number_of_connections-val ((m <BatteryStateMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:number_of_connections-val is deprecated.  Use srcp2_msgs-msg:number_of_connections instead.")
  (number_of_connections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryStateMsg>) ostream)
  "Serializes a message object of type '<BatteryStateMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_capacity_watt_hours))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_discharge_rate_watts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_capacity_watt_hours))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_consumption_watts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'safe_mode_avail_frac))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'safe_mode_percent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'shutdown_percent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'overload)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'number_of_connections)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryStateMsg>) istream)
  "Deserializes a message object of type '<BatteryStateMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_capacity_watt_hours) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_discharge_rate_watts) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_capacity_watt_hours) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_consumption_watts) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'safe_mode_avail_frac) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'safe_mode_percent) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shutdown_percent) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'overload) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_of_connections) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryStateMsg>)))
  "Returns string type for a message object of type '<BatteryStateMsg>"
  "srcp2_msgs/BatteryStateMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryStateMsg)))
  "Returns string type for a message object of type 'BatteryStateMsg"
  "srcp2_msgs/BatteryStateMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryStateMsg>)))
  "Returns md5sum for a message object of type '<BatteryStateMsg>"
  "6d06a9dfb08ec8e2eec28de188121f4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryStateMsg)))
  "Returns md5sum for a message object of type 'BatteryStateMsg"
  "6d06a9dfb08ec8e2eec28de188121f4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryStateMsg>)))
  "Returns full string definition for message of type '<BatteryStateMsg>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message allows battery of a robot to communicate how much power is left~%#~%~%Header  header~%~%float32 max_capacity_watt_hours         # maximum capacity of the battery~%float32 max_discharge_rate_watts        # maximum total number of instantaneous watts available~%float32 current_capacity_watt_hours     # current capacity of the battery~%float32 current_consumption_watts       # current power consumption in watts~%float32 safe_mode_avail_frac            # fraction of power available in safe mode~%float32 safe_mode_percent               # power level at which rover functionality is limited~%float32 shutdown_percent                # power level at which rover functionality is halted~%int32 mode                              # mode of the battery, 0 = fully_operation, 1 = power_saving_mode, 2 = emergency_shutdown~%int32 overload                          # 0 = no overload, 1 = overload~%int32 number_of_connections             # number of consumers~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryStateMsg)))
  "Returns full string definition for message of type 'BatteryStateMsg"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message allows battery of a robot to communicate how much power is left~%#~%~%Header  header~%~%float32 max_capacity_watt_hours         # maximum capacity of the battery~%float32 max_discharge_rate_watts        # maximum total number of instantaneous watts available~%float32 current_capacity_watt_hours     # current capacity of the battery~%float32 current_consumption_watts       # current power consumption in watts~%float32 safe_mode_avail_frac            # fraction of power available in safe mode~%float32 safe_mode_percent               # power level at which rover functionality is limited~%float32 shutdown_percent                # power level at which rover functionality is halted~%int32 mode                              # mode of the battery, 0 = fully_operation, 1 = power_saving_mode, 2 = emergency_shutdown~%int32 overload                          # 0 = no overload, 1 = overload~%int32 number_of_connections             # number of consumers~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryStateMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryStateMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryStateMsg
    (cl:cons ':header (header msg))
    (cl:cons ':max_capacity_watt_hours (max_capacity_watt_hours msg))
    (cl:cons ':max_discharge_rate_watts (max_discharge_rate_watts msg))
    (cl:cons ':current_capacity_watt_hours (current_capacity_watt_hours msg))
    (cl:cons ':current_consumption_watts (current_consumption_watts msg))
    (cl:cons ':safe_mode_avail_frac (safe_mode_avail_frac msg))
    (cl:cons ':safe_mode_percent (safe_mode_percent msg))
    (cl:cons ':shutdown_percent (shutdown_percent msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':overload (overload msg))
    (cl:cons ':number_of_connections (number_of_connections msg))
))
