; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-msg)


;//! \htmlinclude ExcavatorScoopMsg.msg.html

(cl:defclass <ExcavatorScoopMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (volatile_clod_mass
    :reader volatile_clod_mass
    :initarg :volatile_clod_mass
    :type cl:boolean
    :initform cl:nil)
   (regolith_clod_mass
    :reader regolith_clod_mass
    :initarg :regolith_clod_mass
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExcavatorScoopMsg (<ExcavatorScoopMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExcavatorScoopMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExcavatorScoopMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-msg:<ExcavatorScoopMsg> is deprecated: use srcp2_msgs-msg:ExcavatorScoopMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ExcavatorScoopMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:header-val is deprecated.  Use srcp2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'volatile_clod_mass-val :lambda-list '(m))
(cl:defmethod volatile_clod_mass-val ((m <ExcavatorScoopMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:volatile_clod_mass-val is deprecated.  Use srcp2_msgs-msg:volatile_clod_mass instead.")
  (volatile_clod_mass m))

(cl:ensure-generic-function 'regolith_clod_mass-val :lambda-list '(m))
(cl:defmethod regolith_clod_mass-val ((m <ExcavatorScoopMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:regolith_clod_mass-val is deprecated.  Use srcp2_msgs-msg:regolith_clod_mass instead.")
  (regolith_clod_mass m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExcavatorScoopMsg>) ostream)
  "Serializes a message object of type '<ExcavatorScoopMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'volatile_clod_mass) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'regolith_clod_mass) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExcavatorScoopMsg>) istream)
  "Deserializes a message object of type '<ExcavatorScoopMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'volatile_clod_mass) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'regolith_clod_mass) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExcavatorScoopMsg>)))
  "Returns string type for a message object of type '<ExcavatorScoopMsg>"
  "srcp2_msgs/ExcavatorScoopMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExcavatorScoopMsg)))
  "Returns string type for a message object of type 'ExcavatorScoopMsg"
  "srcp2_msgs/ExcavatorScoopMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExcavatorScoopMsg>)))
  "Returns md5sum for a message object of type '<ExcavatorScoopMsg>"
  "218c9d9ac34cff7d7bc66c14b96e45df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExcavatorScoopMsg)))
  "Returns md5sum for a message object of type 'ExcavatorScoopMsg"
  "218c9d9ac34cff7d7bc66c14b96e45df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExcavatorScoopMsg>)))
  "Returns full string definition for message of type '<ExcavatorScoopMsg>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2021, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message publishes the current score, and volatile collection state~%# for this simulation~%#~%Header header~%~%# scoop data~%bool volatile_clod_mass # is volatile mass in scoop~%bool regolith_clod_mass # is regolith mass in scoop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExcavatorScoopMsg)))
  "Returns full string definition for message of type 'ExcavatorScoopMsg"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2021, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message publishes the current score, and volatile collection state~%# for this simulation~%#~%Header header~%~%# scoop data~%bool volatile_clod_mass # is volatile mass in scoop~%bool regolith_clod_mass # is regolith mass in scoop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExcavatorScoopMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExcavatorScoopMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ExcavatorScoopMsg
    (cl:cons ':header (header msg))
    (cl:cons ':volatile_clod_mass (volatile_clod_mass msg))
    (cl:cons ':regolith_clod_mass (regolith_clod_mass msg))
))
