; Auto-generated. Do not edit!


(cl:in-package srcp2_msgs-msg)


;//! \htmlinclude ScoreMsg.msg.html

(cl:defclass <ScoreMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (hauler_volatile_score
    :reader hauler_volatile_score
    :initarg :hauler_volatile_score
    :type cl:float
    :initform 0.0)
   (types_collected
    :reader types_collected
    :initarg :types_collected
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (masses_collected_kg
    :reader masses_collected_kg
    :initarg :masses_collected_kg
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ScoreMsg (<ScoreMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScoreMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScoreMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name srcp2_msgs-msg:<ScoreMsg> is deprecated: use srcp2_msgs-msg:ScoreMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ScoreMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:header-val is deprecated.  Use srcp2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <ScoreMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:score-val is deprecated.  Use srcp2_msgs-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'hauler_volatile_score-val :lambda-list '(m))
(cl:defmethod hauler_volatile_score-val ((m <ScoreMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:hauler_volatile_score-val is deprecated.  Use srcp2_msgs-msg:hauler_volatile_score instead.")
  (hauler_volatile_score m))

(cl:ensure-generic-function 'types_collected-val :lambda-list '(m))
(cl:defmethod types_collected-val ((m <ScoreMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:types_collected-val is deprecated.  Use srcp2_msgs-msg:types_collected instead.")
  (types_collected m))

(cl:ensure-generic-function 'masses_collected_kg-val :lambda-list '(m))
(cl:defmethod masses_collected_kg-val ((m <ScoreMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader srcp2_msgs-msg:masses_collected_kg-val is deprecated.  Use srcp2_msgs-msg:masses_collected_kg instead.")
  (masses_collected_kg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScoreMsg>) ostream)
  "Serializes a message object of type '<ScoreMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hauler_volatile_score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'types_collected))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'types_collected))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'masses_collected_kg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'masses_collected_kg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScoreMsg>) istream)
  "Deserializes a message object of type '<ScoreMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hauler_volatile_score) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'types_collected) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'types_collected)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'masses_collected_kg) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'masses_collected_kg)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScoreMsg>)))
  "Returns string type for a message object of type '<ScoreMsg>"
  "srcp2_msgs/ScoreMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScoreMsg)))
  "Returns string type for a message object of type 'ScoreMsg"
  "srcp2_msgs/ScoreMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScoreMsg>)))
  "Returns md5sum for a message object of type '<ScoreMsg>"
  "d717730154f875f7091c54cda3c9ac8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScoreMsg)))
  "Returns md5sum for a message object of type 'ScoreMsg"
  "d717730154f875f7091c54cda3c9ac8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScoreMsg>)))
  "Returns full string definition for message of type '<ScoreMsg>"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2021, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message publishes the current score, and volatile collection state~%# for this simulation~%#~%Header header~%~%# scoring data~%float64 score # the current total score for this sim~%float64 hauler_volatile_score # the score of all the volatiles currently held in hauler bins (tie-breaker #1)~%~%# collection data (indexes align) -- this is for competitor information and used in tie-breaking~%string[] types_collected      # which types have been collected to date?~%float64[] masses_collected_kg # how much each type?~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScoreMsg)))
  "Returns full string definition for message of type 'ScoreMsg"
  (cl:format cl:nil "#~%# Space Robotics Simulation, Phase 2~%# Copyright (c) 2021, NASA-JSC. All Rights Reserved~%# Unauthorized copying or distribution of this code is strictly prohibited~%#~%# ~%# This message publishes the current score, and volatile collection state~%# for this simulation~%#~%Header header~%~%# scoring data~%float64 score # the current total score for this sim~%float64 hauler_volatile_score # the score of all the volatiles currently held in hauler bins (tie-breaker #1)~%~%# collection data (indexes align) -- this is for competitor information and used in tie-breaking~%string[] types_collected      # which types have been collected to date?~%float64[] masses_collected_kg # how much each type?~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScoreMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'types_collected) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'masses_collected_kg) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScoreMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ScoreMsg
    (cl:cons ':header (header msg))
    (cl:cons ':score (score msg))
    (cl:cons ':hauler_volatile_score (hauler_volatile_score msg))
    (cl:cons ':types_collected (types_collected msg))
    (cl:cons ':masses_collected_kg (masses_collected_kg msg))
))
