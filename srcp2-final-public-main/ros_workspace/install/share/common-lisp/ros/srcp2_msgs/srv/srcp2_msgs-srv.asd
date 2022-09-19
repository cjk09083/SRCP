
(cl:in-package :asdf)

(defsystem "srcp2_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "BrakeRoverSrv" :depends-on ("_package_BrakeRoverSrv"))
    (:file "_package_BrakeRoverSrv" :depends-on ("_package"))
    (:file "ChargingStationSrv" :depends-on ("_package_ChargingStationSrv"))
    (:file "_package_ChargingStationSrv" :depends-on ("_package"))
    (:file "LocalizationSrv" :depends-on ("_package_LocalizationSrv"))
    (:file "_package_LocalizationSrv" :depends-on ("_package"))
    (:file "PidListSrv" :depends-on ("_package_PidListSrv"))
    (:file "_package_PidListSrv" :depends-on ("_package"))
    (:file "PidTuningSrv" :depends-on ("_package_PidTuningSrv"))
    (:file "_package_PidTuningSrv" :depends-on ("_package"))
    (:file "SpotLightSrv" :depends-on ("_package_SpotLightSrv"))
    (:file "_package_SpotLightSrv" :depends-on ("_package"))
    (:file "StartStopSrv" :depends-on ("_package_StartStopSrv"))
    (:file "_package_StartStopSrv" :depends-on ("_package"))
    (:file "SystemPowerSaveSrv" :depends-on ("_package_SystemPowerSaveSrv"))
    (:file "_package_SystemPowerSaveSrv" :depends-on ("_package"))
  ))