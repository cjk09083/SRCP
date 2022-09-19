; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-srv)


;//! \htmlinclude PidListSrv-request.msg.html

(cl:defclass <PidListSrv-request> (roslisp-msg-protocol:ros-message)
  ((show_list
    :reader show_list
    :initarg :show_list
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PidListSrv-request (<PidListSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PidListSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PidListSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<PidListSrv-request> is deprecated: use srcp2_msgs-srv:PidListSrv-request instead.")))

(cl:ensure-generic-function 'show_list-val :lambda-list '(m))
(cl:defmethod show_list-val ((m <PidListSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:show_list-val is deprecated.  Use srcp2_msgs-srv:show_list instead.")
  (show_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PidListSrv-request>) ostream)
  "Serializes a message object of type '<PidListSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'show_list) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PidListSrv-request>) istream)
  "Deserializes a message object of type '<PidListSrv-request>"
    (cl:setf (cl:slot-value msg 'show_list) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PidListSrv-request>)))
  "Returns string type for a service object of type '<PidListSrv-request>"
  "srcp2_msgs/PidListSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PidListSrv-request)))
  "Returns string type for a service object of type 'PidListSrv-request"
  "srcp2_msgs/PidListSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PidListSrv-request>)))
  "Returns md5sum for a message object of type '<PidListSrv-request>"
  "3f65269ed0f5642343d3d700bb52a4e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PidListSrv-request)))
  "Returns md5sum for a message object of type 'PidListSrv-request"
  "3f65269ed0f5642343d3d700bb52a4e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PidListSrv-request>)))
  "Returns full string definition for message of type '<PidListSrv-request>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2020, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%bool     show_list    # shows all current PIDs of the rover's joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PidListSrv-request)))
  "Returns full string definition for message of type 'PidListSrv-request"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2020, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%bool     show_list    # shows all current PIDs of the rover's joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PidListSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PidListSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PidListSrv-request
    (cl:cons ':show_list (show_list msg))
))
;//! \htmlinclude PidListSrv-response.msg.html

(cl:defclass <PidListSrv-response> (roslisp-msg-protocol:ros-message)
  ((finished
    :reader finished
    :initarg :finished
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PidListSrv-response (<PidListSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PidListSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PidListSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-srv:<PidListSrv-response> is deprecated: use srcp2_msgs-srv:PidListSrv-response instead.")))

(cl:ensure-generic-function 'finished-val :lambda-list '(m))
(cl:defmethod finished-val ((m <PidListSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-srv:finished-val is deprecated.  Use srcp2_msgs-srv:finished instead.")
  (finished m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PidListSrv-response>) ostream)
  "Serializes a message object of type '<PidListSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'finished) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PidListSrv-response>) istream)
  "Deserializes a message object of type '<PidListSrv-response>"
    (cl:setf (cl:slot-value msg 'finished) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PidListSrv-response>)))
  "Returns string type for a service object of type '<PidListSrv-response>"
  "srcp2_msgs/PidListSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PidListSrv-response)))
  "Returns string type for a service object of type 'PidListSrv-response"
  "srcp2_msgs/PidListSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PidListSrv-response>)))
  "Returns md5sum for a message object of type '<PidListSrv-response>"
  "3f65269ed0f5642343d3d700bb52a4e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PidListSrv-response)))
  "Returns md5sum for a message object of type 'PidListSrv-response"
  "3f65269ed0f5642343d3d700bb52a4e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PidListSrv-response>)))
  "Returns full string definition for message of type '<PidListSrv-response>"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PidListSrv-response)))
  "Returns full string definition for message of type 'PidListSrv-response"
  (cl:format cl:nil "bool finished~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PidListSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PidListSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PidListSrv-response
    (cl:cons ':finished (finished msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PidListSrv)))
  'PidListSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PidListSrv)))
  'PidListSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PidListSrv)))
  "Returns string type for a service object of type '<PidListSrv>"
  "srcp2_msgs/PidListSrv")