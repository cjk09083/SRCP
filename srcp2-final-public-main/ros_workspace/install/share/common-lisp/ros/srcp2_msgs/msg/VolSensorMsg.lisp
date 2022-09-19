; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-msg)


;//! \htmlinclude VolSensorMsg.msg.html

(cl:defclass <VolSensorMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vol_type
    :reader vol_type
    :initarg :vol_type
    :type cl:string
    :initform "")
   (distance_to
    :reader distance_to
    :initarg :distance_to
    :type cl:float
    :initform 0.0))
)

(cl:defclass VolSensorMsg (<VolSensorMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VolSensorMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VolSensorMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-msg:<VolSensorMsg> is deprecated: use srcp2_msgs-msg:VolSensorMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VolSensorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:header-val is deprecated.  Use srcp2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vol_type-val :lambda-list '(m))
(cl:defmethod vol_type-val ((m <VolSensorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:vol_type-val is deprecated.  Use srcp2_msgs-msg:vol_type instead.")
  (vol_type m))

(cl:ensure-generic-function 'distance_to-val :lambda-list '(m))
(cl:defmethod distance_to-val ((m <VolSensorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:distance_to-val is deprecated.  Use srcp2_msgs-msg:distance_to instead.")
  (distance_to m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VolSensorMsg>) ostream)
  "Serializes a message object of type '<VolSensorMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vol_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vol_type))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance_to))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VolSensorMsg>) istream)
  "Deserializes a message object of type '<VolSensorMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vol_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vol_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance_to) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VolSensorMsg>)))
  "Returns string type for a message object of type '<VolSensorMsg>"
  "srcp2_msgs/VolSensorMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VolSensorMsg)))
  "Returns string type for a message object of type 'VolSensorMsg"
  "srcp2_msgs/VolSensorMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VolSensorMsg>)))
  "Returns md5sum for a message object of type '<VolSensorMsg>"
  "79d667cc3950eac40bb1e3adee91ec19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VolSensorMsg)))
  "Returns md5sum for a message object of type 'VolSensorMsg"
  "79d667cc3950eac40bb1e3adee91ec19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VolSensorMsg>)))
  "Returns full string definition for message of type '<VolSensorMsg>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019-2020, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# Volatile Sensor query message.~%#~%Header      header~%string      vol_type         # the type name string~%float32     distance_to      # absolute distance from sensor to volatile (meters)~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VolSensorMsg)))
  "Returns full string definition for message of type 'VolSensorMsg"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019-2020, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# Volatile Sensor query message.~%#~%Header      header~%string      vol_type         # the type name string~%float32     distance_to      # absolute distance from sensor to volatile (meters)~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VolSensorMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'vol_type))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VolSensorMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'VolSensorMsg
    (cl:cons ':header (header msg))
    (cl:cons ':vol_type (vol_type msg))
    (cl:cons ':distance_to (distance_to msg))
))
