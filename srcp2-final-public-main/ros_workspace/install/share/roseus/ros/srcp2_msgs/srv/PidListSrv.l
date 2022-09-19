;; Auto-generated. Do not edit!


(when (boundp 'srcp2_msgs::PidListSrv)
  (if (not (find-package "SRCP2_MSGS"))
    (make-package "SRCP2_MSGS"))
  (shadow 'PidListSrv (find-package "SRCP2_MSGS")))
(unless (find-package "SRCP2_MSGS::PIDLISTSRV")
  (make-package "SRCP2_MSGS::PIDLISTSRV"))
(unless (find-package "SRCP2_MSGS::PIDLISTSRVREQUEST")
  (make-package "SRCP2_MSGS::PIDLISTSRVREQUEST"))
(unless (find-package "SRCP2_MSGS::PIDLISTSRVRESPONSE")
  (make-package "SRCP2_MSGS::PIDLISTSRVRESPONSE"))

(in-package "ROS")





(defclass srcp2_msgs::PidListSrvRequest
  :super ros::object
  :slots (_show_list ))

(defmethod srcp2_msgs::PidListSrvRequest
  (:init
   (&key
    ((:show_list __show_list) nil)
    )
   (send-super :init)
   (setq _show_list __show_list)
   self)
  (:show_list
   (&optional (__show_list :null))
   (if (not (eq __show_list :null)) (setq _show_list __show_list)) _show_list)
  (:serialization-length
   ()
   (+
    ;; bool _show_list
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _show_list
       (if _show_list (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _show_list
     (setq _show_list (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass srcp2_msgs::PidListSrvResponse
  :super ros::object
  :slots (_finished ))

(defmethod srcp2_msgs::PidListSrvResponse
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

(defclass srcp2_msgs::PidListSrv
  :super ros::object
  :slots ())

(setf (get srcp2_msgs::PidListSrv :md5sum-) "3f65269ed0f5642343d3d700bb52a4e0")
(setf (get srcp2_msgs::PidListSrv :datatype-) "srcp2_msgs/PidListSrv")
(setf (get srcp2_msgs::PidListSrv :request) srcp2_msgs::PidListSrvRequest)
(setf (get srcp2_msgs::PidListSrv :response) srcp2_msgs::PidListSrvResponse)

(defmethod srcp2_msgs::PidListSrvRequest
  (:response () (instance srcp2_msgs::PidListSrvResponse :init)))

(setf (get srcp2_msgs::PidListSrvRequest :md5sum-) "3f65269ed0f5642343d3d700bb52a4e0")
(setf (get srcp2_msgs::PidListSrvRequest :datatype-) "srcp2_msgs/PidListSrvRequest")
(setf (get srcp2_msgs::PidListSrvRequest :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2020, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
bool     show_list    # shows all current PIDs of the rover's joints
---
bool finished
")

(setf (get srcp2_msgs::PidListSrvResponse :md5sum-) "3f65269ed0f5642343d3d700bb52a4e0")
(setf (get srcp2_msgs::PidListSrvResponse :datatype-) "srcp2_msgs/PidListSrvResponse")
(setf (get srcp2_msgs::PidListSrvResponse :definition-)
      "#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2020, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
bool     show_list    # shows all current PIDs of the rover's joints
---
bool finished
")



(provide :srcp2_msgs/PidListSrv "3f65269ed0f5642343d3d700bb52a4e0")


