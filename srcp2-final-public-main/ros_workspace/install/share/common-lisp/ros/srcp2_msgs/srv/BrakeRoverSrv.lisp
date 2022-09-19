; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-srv)


;//! \htmlinclude BrakeRoverSrv-request.msg.html

(cl:defclass <BrakeRoverSrv-request> (roslisp-msg-protocol:ros-message)
  ((brake_force
    :reader brake_force
    :initarg :brake_force
    :type cl:float
    :initform 0.0))
)

(cl:defclass BrakeRoverSrv-request (<BrakeRoverSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BrakeRoverSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BrakeRoverSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<BrakeRoverSrv-request> is deprecated: use srcp2_msgs-srv:BrakeRoverSrv-request instead.")))

(cl:ensure-generic-function 'brake_force-val :lambda-list '(m))
(cl:defmethod brake_force-val ((m <BrakeRoverSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:brake_force-val is deprecated.  Use srcp2_msgs-srv:brake_force instead.")
  (brake_force m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BrakeRoverSrv-request>) ostream)
  "Serializes a message object of type '<BrakeRoverSrv-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'brake_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BrakeRoverSrv-request>) istream)
  "Deserializes a message object of type '<BrakeRoverSrv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_force) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BrakeRoverSrv-request>)))
  "Returns string type for a service object of type '<BrakeRoverSrv-request>"
  "srcp2_msgs/BrakeRoverSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BrakeRoverSrv-request)))
  "Returns string type for a service object of type 'BrakeRoverSrv-request"
  "srcp2_msgs/BrakeRoverSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BrakeRoverSrv-request>)))
  "Returns md5sum for a message object of type '<BrakeRoverSrv-request>"
  "0c30799110874cd224d9a2d9de3215fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BrakeRoverSrv-request)))
  "Returns md5sum for a message object of type 'BrakeRoverSrv-request"
  "0c30799110874cd224d9a2d9de3215fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BrakeRoverSrv-request>)))
  "Returns full string definition for message of type '<BrakeRoverSrv-request>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%float64 brake_force~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BrakeRoverSrv-request)))
  "Returns full string definition for message of type 'BrakeRoverSrv-request"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%float64 brake_force~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BrakeRoverSrv-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BrakeRoverSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BrakeRoverSrv-request
    (cl:cons ':brake_force (brake_force msg))
))
;//! \htmlinclude BrakeRoverSrv-response.msg.html

(cl:defclass <BrakeRoverSrv-response> (roslisp-msg-protocol:ros-message)
  ((finished
    :reader finished
    :initarg :finished
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BrakeRoverSrv-response (<BrakeRoverSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BrakeRoverSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BrakeRoverSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<BrakeRoverSrv-response> is deprecated: use srcp2_msgs-srv:BrakeRoverSrv-response instead.")))

(cl:ensure-generic-function 'finished-val :lambda-list '(m))
(cl:defmethod finished-val ((m <BrakeRoverSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:finished-val is deprecated.  Use srcp2_msgs-srv:finished instead.")
  (finished m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BrakeRoverSrv-response>) ostream)
  "Serializes a message object of type '<BrakeRoverSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finished) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BrakeRoverSrv-response>) istream)
  "Deserializes a message object of type '<BrakeRoverSrv-response>"
    (cl:setf (cl:slot-value msg 'finished) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BrakeRoverSrv-response>)))
  "Returns string type for a service object of type '<BrakeRoverSrv-response>"
  "srcp2_msgs/BrakeRoverSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BrakeRoverSrv-response)))
  "Returns string type for a service object of type 'BrakeRoverSrv-response"
  "srcp2_msgs/BrakeRoverSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BrakeRoverSrv-response>)))
  "Returns md5sum for a message object of type '<BrakeRoverSrv-response>"
  "0c30799110874cd224d9a2d9de3215fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BrakeRoverSrv-response)))
  "Returns md5sum for a message object of type 'BrakeRoverSrv-response"
  "0c30799110874cd224d9a2d9de3215fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BrakeRoverSrv-response>)))
  "Returns full string definition for message of type '<BrakeRoverSrv-response>"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BrakeRoverSrv-response)))
  "Returns full string definition for message of type 'BrakeRoverSrv-response"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BrakeRoverSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BrakeRoverSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BrakeRoverSrv-response
    (cl:cons ':finished (finished msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BrakeRoverSrv)))
  'BrakeRoverSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BrakeRoverSrv)))
  'BrakeRoverSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BrakeRoverSrv)))
  "Returns string type for a service object of type '<BrakeRoverSrv>"
  "srcp2_msgs/BrakeRoverSrv")