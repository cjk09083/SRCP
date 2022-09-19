; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-srv)


;//! \htmlinclude SpotLightSrv-request.msg.html

(cl:defclass <SpotLightSrv-request> (roslisp-msg-protocol:ros-message)
  ((range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0))
)

(cl:defclass SpotLightSrv-request (<SpotLightSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpotLightSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpotLightSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<SpotLightSrv-request> is deprecated: use srcp2_msgs-srv:SpotLightSrv-request instead.")))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <SpotLightSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:range-val is deprecated.  Use srcp2_msgs-srv:range instead.")
  (range m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpotLightSrv-request>) ostream)
  "Serializes a message object of type '<SpotLightSrv-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpotLightSrv-request>) istream)
  "Deserializes a message object of type '<SpotLightSrv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpotLightSrv-request>)))
  "Returns string type for a service object of type '<SpotLightSrv-request>"
  "srcp2_msgs/SpotLightSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpotLightSrv-request)))
  "Returns string type for a service object of type 'SpotLightSrv-request"
  "srcp2_msgs/SpotLightSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpotLightSrv-request>)))
  "Returns md5sum for a message object of type '<SpotLightSrv-request>"
  "e98a2777615dc21bee2bf971bff096b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpotLightSrv-request)))
  "Returns md5sum for a message object of type 'SpotLightSrv-request"
  "e98a2777615dc21bee2bf971bff096b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpotLightSrv-request>)))
  "Returns full string definition for message of type '<SpotLightSrv-request>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%#~%# Robot spot-light control~%#~%float64 range~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpotLightSrv-request)))
  "Returns full string definition for message of type 'SpotLightSrv-request"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%#~%# Robot spot-light control~%#~%float64 range~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpotLightSrv-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpotLightSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SpotLightSrv-request
    (cl:cons ':range (range msg))
))
;//! \htmlinclude SpotLightSrv-response.msg.html

(cl:defclass <SpotLightSrv-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SpotLightSrv-response (<SpotLightSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpotLightSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpotLightSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<SpotLightSrv-response> is deprecated: use srcp2_msgs-srv:SpotLightSrv-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SpotLightSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:success-val is deprecated.  Use srcp2_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpotLightSrv-response>) ostream)
  "Serializes a message object of type '<SpotLightSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpotLightSrv-response>) istream)
  "Deserializes a message object of type '<SpotLightSrv-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpotLightSrv-response>)))
  "Returns string type for a service object of type '<SpotLightSrv-response>"
  "srcp2_msgs/SpotLightSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpotLightSrv-response)))
  "Returns string type for a service object of type 'SpotLightSrv-response"
  "srcp2_msgs/SpotLightSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpotLightSrv-response>)))
  "Returns md5sum for a message object of type '<SpotLightSrv-response>"
  "e98a2777615dc21bee2bf971bff096b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpotLightSrv-response)))
  "Returns md5sum for a message object of type 'SpotLightSrv-response"
  "e98a2777615dc21bee2bf971bff096b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpotLightSrv-response>)))
  "Returns full string definition for message of type '<SpotLightSrv-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpotLightSrv-response)))
  "Returns full string definition for message of type 'SpotLightSrv-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpotLightSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpotLightSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SpotLightSrv-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SpotLightSrv)))
  'SpotLightSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SpotLightSrv)))
  'SpotLightSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpotLightSrv)))
  "Returns string type for a service object of type '<SpotLightSrv>"
  "srcp2_msgs/SpotLightSrv")