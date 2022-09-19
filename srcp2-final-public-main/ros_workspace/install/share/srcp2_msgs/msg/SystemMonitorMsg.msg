#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message allows battery of a robot to communicate how much power is left
#

# Power State Constants
uint8 POWER_HEALTH_OK        = 0
uint8 POWER_HEALTH_LOW       = 1
uint8 POWER_HEALTH_EMERGENCY = 2

# Battery Mode Constants
uint8 BATTERY_MODE_NO_CHANGE       =0
uint8 BATTERY_MODE_CHARGE_HIGH     =1
uint8 BATTERY_MODE_CHARGE_NORMAL   =2
uint8 BATTERY_MODE_CHARGE_SLOW     =3
uint8 BATTERY_MODE_DISCHARGE_HIGH  =4
uint8 BATTERY_MODE_DISCHARGE_NORMAL=5
uint8 BATTERY_MODE_DISCHARGE_SLOW  =6
uint8 BATTERY_MODE_DISCHARGE_CONSERVE  =7
uint8 BATTERY_MODE_FAST_REPAIR     =8


#*************** The message **************
Header  header

int8    power_health    #
bool    power_saver     #
bool    solar_ok        #
bool    power_demand    #
int8    battery_mode    #
float32 power_level     #
float32 power_rate      #
