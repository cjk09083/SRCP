#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2019, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message allows battery of a robot to communicate how much power is left
#

Header  header

float32 max_capacity_watt_hours         # maximum capacity of the battery
float32 max_discharge_rate_watts        # maximum total number of instantaneous watts available
float32 current_capacity_watt_hours     # current capacity of the battery
float32 current_consumption_watts       # current power consumption in watts
float32 safe_mode_avail_frac            # fraction of power available in safe mode
float32 safe_mode_percent               # power level at which rover functionality is limited
float32 shutdown_percent                # power level at which rover functionality is halted
int32 mode                              # mode of the battery, 0 = fully_operation, 1 = power_saving_mode, 2 = emergency_shutdown
int32 overload                          # 0 = no overload, 1 = overload
int32 number_of_connections             # number of consumers
