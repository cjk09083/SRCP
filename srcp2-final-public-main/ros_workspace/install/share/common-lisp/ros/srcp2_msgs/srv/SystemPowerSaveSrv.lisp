; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-srv)


;//! \htmlinclude SystemPowerSaveSrv-request.msg.html

(cl:defclass <SystemPowerSaveSrv-request> (roslisp-msg-protocol:ros-message)
  ((power_save
    :reader power_save
    :initarg :power_save
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SystemPowerSaveSrv-request (<SystemPowerSaveSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SystemPowerSaveSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SystemPowerSaveSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<SystemPowerSaveSrv-request> is deprecated: use srcp2_msgs-srv:SystemPowerSaveSrv-request instead.")))

(cl:ensure-generic-function 'power_save-val :lambda-list '(m))
(cl:defmethod power_save-val ((m <SystemPowerSaveSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:power_save-val is deprecated.  Use srcp2_msgs-srv:power_save instead.")
  (power_save m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SystemPowerSaveSrv-request>) ostream)
  "Serializes a message object of type '<SystemPowerSaveSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_save) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SystemPowerSaveSrv-request>) istream)
  "Deserializes a message object of type '<SystemPowerSaveSrv-request>"
    (cl:setf (cl:slot-value msg 'power_save) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SystemPowerSaveSrv-request>)))
  "Returns string type for a service object of type '<SystemPowerSaveSrv-request>"
  "srcp2_msgs/SystemPowerSaveSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemPowerSaveSrv-request)))
  "Returns string type for a service object of type 'SystemPowerSaveSrv-request"
  "srcp2_msgs/SystemPowerSaveSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SystemPowerSaveSrv-request>)))
  "Returns md5sum for a message object of type '<SystemPowerSaveSrv-request>"
  "7952b3919e8de2c1fd024be9ea064cf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SystemPowerSaveSrv-request)))
  "Returns md5sum for a message object of type 'SystemPowerSaveSrv-request"
  "7952b3919e8de2c1fd024be9ea064cf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SystemPowerSaveSrv-request>)))
  "Returns full string definition for message of type '<SystemPowerSaveSrv-request>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%bool power_save~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SystemPowerSaveSrv-request)))
  "Returns full string definition for message of type 'SystemPowerSaveSrv-request"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%bool power_save~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SystemPowerSaveSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SystemPowerSaveSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SystemPowerSaveSrv-request
    (cl:cons ':power_save (power_save msg))
))
;//! \htmlinclude SystemPowerSaveSrv-response.msg.html

(cl:defclass <SystemPowerSaveSrv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SystemPowerSaveSrv-response (<SystemPowerSaveSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SystemPowerSaveSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SystemPowerSaveSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<SystemPowerSaveSrv-response> is deprecated: use srcp2_msgs-srv:SystemPowerSaveSrv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SystemPowerSaveSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:success-val is deprecated.  Use srcp2_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SystemPowerSaveSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:message-val is deprecated.  Use srcp2_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SystemPowerSaveSrv-response>) ostream)
  "Serializes a message object of type '<SystemPowerSaveSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SystemPowerSaveSrv-response>) istream)
  "Deserializes a message object of type '<SystemPowerSaveSrv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SystemPowerSaveSrv-response>)))
  "Returns string type for a service object of type '<SystemPowerSaveSrv-response>"
  "srcp2_msgs/SystemPowerSaveSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemPowerSaveSrv-response)))
  "Returns string type for a service object of type 'SystemPowerSaveSrv-response"
  "srcp2_msgs/SystemPowerSaveSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SystemPowerSaveSrv-response>)))
  "Returns md5sum for a message object of type '<SystemPowerSaveSrv-response>"
  "7952b3919e8de2c1fd024be9ea064cf1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SystemPowerSaveSrv-response)))
  "Returns md5sum for a message object of type 'SystemPowerSaveSrv-response"
  "7952b3919e8de2c1fd024be9ea064cf1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SystemPowerSaveSrv-response>)))
  "Returns full string definition for message of type '<SystemPowerSaveSrv-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SystemPowerSaveSrv-response)))
  "Returns full string definition for message of type 'SystemPowerSaveSrv-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SystemPowerSaveSrv-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SystemPowerSaveSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SystemPowerSaveSrv-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SystemPowerSaveSrv)))
  'SystemPowerSaveSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SystemPowerSaveSrv)))
  'SystemPowerSaveSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SystemPowerSaveSrv)))
  "Returns string type for a service object of type '<SystemPowerSaveSrv>"
  "srcp2_msgs/SystemPowerSaveSrv")