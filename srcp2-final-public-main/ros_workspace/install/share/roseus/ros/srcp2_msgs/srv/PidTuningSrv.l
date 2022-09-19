;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::PidTuningSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'PidTuningSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::PIDTUNINGSRV")
  (make-package "SRCP2_MSGS::PIDTUNINGSRV"))
(unless (find-package "SRCP2_MSGS::PIDTUNINGSRVREQUEST")
  (make-package "SRCP2_MSGS::PIDTUNINGSRVREQUEST"))
(unless (find-package "SRCP2_MSGS::PIDTUNINGSRVRESPONSE")
  (make-package "SRCP2_MSGS::PIDTUNINGSRVRESPONSE"))

(in-package "ROS")





(defclass srcp2_msgs::PidTuningSrvRequest
  :super ros::object
  :slots (_joint _Kp _Ki _Kd ))

(defmethod srcp2_msgs::PidTuningSrvRequest
  (:init
   (&key
    ((:joint __joint) "")
    ((:Kp __Kp) 0.0)
    ((:Ki __Ki) 0.0)
    ((:Kd __Kd) 0.0)
    )
   (send-super :init)
   (setq _joint (string __joint))
   (setq _Kp (float __Kp))
   (setq _Ki (float __Ki))
   (setq _Kd (float __Kd))
   self)
  (:joint
   (&optional __joint)
   (if __joint (setq _joint __joint)) _joint)
  (:Kp
   (&optional __Kp)
   (if __Kp (setq _Kp __Kp)) _Kp)
  (:Ki
   (&optional __Ki)
   (if __Ki (setq _Ki __Ki)) _Ki)
  (:Kd
   (&optional __Kd)
   (if __Kd (setq _Kd __Kd)) _Kd)
  (:serialization-length
   ()
   (+
    ;; string _joint
    4 (length _joint)
    ;; float64 _Kp
    8
    ;; float64 _Ki
    8
    ;; float64 _Kd
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _joint
       (write-long (length _joint) s) (princ _joint s)
     ;; float64 _Kp
       (sys::poke _Kp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Ki
       (sys::poke _Ki (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kd
       (sys::poke _Kd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _joint
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _joint (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _Kp
     (setq _Kp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Ki
     (setq _Ki (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kd
     (setq _Kd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass srcp2_msgs::PidTuningSrvResponse
  :super ros::object
  :slots (_finished ))

(defmethod srcp2_msgs::PidTuningSrvResponse
  (:init
   (&key
    ((:finished __finished) nil)
    )
   (send-super :init)
   (setq _finished __finished)
   self)
  (:finished
   (&optional (__finished :null))
   (if (not (eq __finished :null)) (setq _finished __finished)) _finished)
  (:serialization-length
   ()
   (+
    ;; bool _finished
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finished
       (if _finished (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finished
     (setq _finished (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::PidTuningSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::PidTuningSrv :md5sum-) "759ddbd36fd49d58db11daa0b08fc8e1")
(setf (get srcp2_msgs::PidTuningSrv :datatype-) "srcp2_msgs/PidTuningSrv")
(setf (get srcp2_msgs::PidTuningSrv :request) srcp2_msgs::PidTuningSrvRequest)
(setf (get srcp2_msgs::PidTuningSrv :response) srcp2_msgs::PidTuningSrvResponse)

(defmethod srcp2_msgs::PidTuningSrvRequest
  (:response () (instance srcp2_msgs::PidTuningSrvResponse :init)))

(setf (get srcp2_msgs::PidTuningSrvRequest :md5sum-) "759ddbd36fd49d58db11daa0b08fc8e1")
(setf (get srcp2_msgs::PidTuningSrvRequest :datatype-) "srcp2_msgs/PidTuningSrvRequest")
(setf (get srcp2_msgs::PidTuningSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2020, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
string   joint    # name of joint
float64  Kp
float64  Ki
float64  Kd
---
bool finished
")

(setf (get srcp2_msgs::PidTuningSrvResponse :md5sum-) "759ddbd36fd49d58db11daa0b08fc8e1")
(setf (get srcp2_msgs::PidTuningSrvResponse :datatype-) "srcp2_msgs/PidTuningSrvResponse")
(setf (get srcp2_msgs::PidTuningSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2020, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
string   joint    # name of joint
float64  Kp
float64  Ki
float64  Kd
---
bool finished
")



(provide :srcp2_msgs/PidTuningSrv "759ddbd36fd49d58db11daa0b08fc8e1")


