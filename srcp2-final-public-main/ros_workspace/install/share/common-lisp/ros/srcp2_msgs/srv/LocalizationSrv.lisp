; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-srv)


;//! \htmlinclude LocalizationSrv-request.msg.html

(cl:defclass <LocalizationSrv-request> (roslisp-msg-protocol:ros-message)
  ((call
    :reader call
    :initarg :call
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LocalizationSrv-request (<LocalizationSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocalizationSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocalizationSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<LocalizationSrv-request> is deprecated: use srcp2_msgs-srv:LocalizationSrv-request instead.")))

(cl:ensure-generic-function 'call-val :lambda-list '(m))
(cl:defmethod call-val ((m <LocalizationSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:call-val is deprecated.  Use srcp2_msgs-srv:call instead.")
  (call m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocalizationSrv-request>) ostream)
  "Serializes a message object of type '<LocalizationSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'call) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocalizationSrv-request>) istream)
  "Deserializes a message object of type '<LocalizationSrv-request>"
    (cl:setf (cl:slot-value msg 'call) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocalizationSrv-request>)))
  "Returns string type for a service object of type '<LocalizationSrv-request>"
  "srcp2_msgs/LocalizationSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocalizationSrv-request)))
  "Returns string type for a service object of type 'LocalizationSrv-request"
  "srcp2_msgs/LocalizationSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocalizationSrv-request>)))
  "Returns md5sum for a message object of type '<LocalizationSrv-request>"
  "c102a4afb0b376754d6cb558ea05ea03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocalizationSrv-request)))
  "Returns md5sum for a message object of type 'LocalizationSrv-request"
  "c102a4afb0b376754d6cb558ea05ea03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocalizationSrv-request>)))
  "Returns full string definition for message of type '<LocalizationSrv-request>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# Service message for getting rover absolute position~%#~%bool call~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocalizationSrv-request)))
  "Returns full string definition for message of type 'LocalizationSrv-request"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2019, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# Service message for getting rover absolute position~%#~%bool call~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocalizationSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocalizationSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LocalizationSrv-request
    (cl:cons ':call (call msg))
))
;//! \htmlinclude LocalizationSrv-response.msg.html

(cl:defclass <LocalizationSrv-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass LocalizationSrv-response (<LocalizationSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocalizationSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocalizationSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<LocalizationSrv-response> is deprecated: use srcp2_msgs-srv:LocalizationSrv-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <LocalizationSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:pose-val is deprecated.  Use srcp2_msgs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocalizationSrv-response>) ostream)
  "Serializes a message object of type '<LocalizationSrv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocalizationSrv-response>) istream)
  "Deserializes a message object of type '<LocalizationSrv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocalizationSrv-response>)))
  "Returns string type for a service object of type '<LocalizationSrv-response>"
  "srcp2_msgs/LocalizationSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocalizationSrv-response)))
  "Returns string type for a service object of type 'LocalizationSrv-response"
  "srcp2_msgs/LocalizationSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocalizationSrv-response>)))
  "Returns md5sum for a message object of type '<LocalizationSrv-response>"
  "c102a4afb0b376754d6cb558ea05ea03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocalizationSrv-response)))
  "Returns md5sum for a message object of type 'LocalizationSrv-response"
  "c102a4afb0b376754d6cb558ea05ea03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocalizationSrv-response>)))
  "Returns full string definition for message of type '<LocalizationSrv-response>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocalizationSrv-response)))
  "Returns full string definition for message of type 'LocalizationSrv-response"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocalizationSrv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocalizationSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LocalizationSrv-response
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LocalizationSrv)))
  'LocalizationSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LocalizationSrv)))
  'LocalizationSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocalizationSrv)))
  "Returns string type for a service object of type '<LocalizationSrv>"
  "srcp2_msgs/LocalizationSrv")