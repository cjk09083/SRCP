#! /usr/bin/env bash
#
# Space Robotics Challenge 2: NASA-JSC
# Copyright (c) 2020, All Rights Reserved
# 
source /home/srcp2/scripts/srcp2_setup.bash

# assume that environment variable settings file already sourced

uniform_drop_height=2.0
uniform_spawn_timeout=2.0
uniform_model_clearance=4.0

# check that everything is ok
mandatory_env_vars=(
    SRCP2_SPAWN_CENTER_X
    SRCP2_SPAWN_CENTER_Y
    SRCP2_SCOUTS
    SRCP2_EXCAVATORS
    SRCP2_HAULERS
    SRCP2_SEED

)
for name in ${mandatory_env_vars[@]}; do
    if [ -z ${!name} ]; then
        echo -e "$echo_error container environment variable \"${name}\" not defined"
        exit 1
    fi
done


# spawn all instances of a class of robot
# arguments:
#  $1 = robot_class
#  $2 = number-to-spawn
#
function spawn(){

    robot_class=$1
    count=$2
    
    SRCP2_SEED_Q=$(echo "var=$SRCP2_SEED;var%=8;var" | bc)
    SRCP2_SEED_FACTOR=$(echo "var=$SRCP2_SEED_Q;var*=4095;var" | bc)

    echo -e "$echo_info Simulation Team Spawn      Q [$SRCP2_SEED_Q]"
    echo -e "$echo_info Simulation Team Spawn Factor [$SRCP2_SEED_FACTOR]"

    origin_y=$SRCP2_SPAWN_CENTER_Y # adjusted left and right for each model
    origin_z=$uniform_drop_height

    case $robot_class in
        "small_scout")
            origin_x=$(echo $SRCP2_SPAWN_CENTER_X + 10.0| bc)
            ;;
        "small_excavator")
            origin_x=$(echo $SRCP2_SPAWN_CENTER_X - $uniform_model_clearance  + 10.0| bc)
            ;;
        "small_hauler")
            origin_x=$(echo $SRCP2_SPAWN_CENTER_X - 2.0*$uniform_model_clearance  + 10.0| bc)
            ;;
        *)
            echo -e "$echo_error robot class \"$robot_class\" unknown"
            return 1
    esac

    for i in $(seq 1 $count); do
        sleep $uniform_spawn_timeout
        gazebo_model_name="${robot_class}_${i}"
        echo -e "$echo_info spawning \"$gazebo_model_name\" into sim"

        y=$(echo "$origin_y - $i*-$uniform_model_clearance" | bc)
        origin_yaw=$(echo "scale=3;3.14*$SRCP2_SEED_FACTOR / 32767" | bc)    
        pose="-x $origin_x -y $y -z $origin_z -R 0 -P 0 -Y $origin_yaw"

        if ! roslaunch \
                srcp2_launch spawn_rover.launch \
                rover_name:="$gazebo_model_name" \
                rover_class:="$robot_class" \
                init_pose:="$pose"; then
            echo -e "$echo_error error in spawning launch"
            return 1
        else
            sleep $uniform_spawn_timeout
            echo -e "$echo_ok Launching TF ${gazebo_model_name} : ${robot_class}"
            nohup   roslaunch srcp2_launch \
                    transforms.launch \
                    rover_name:="${gazebo_model_name}"\
                    rover_class:="${robot_class}" &
        fi    
    done
    return 0
}

# spawn all robots
if ! spawn "small_scout"     $SRCP2_SCOUTS;     then exit 1; fi
if ! spawn "small_excavator" $SRCP2_EXCAVATORS; then exit 1; fi
if ! spawn "small_hauler"    $SRCP2_HAULERS;    then exit 1; fi
origin_x=$SRCP2_SPAWN_CENTER_X
origin_x=$SRCP2_SPAWN_CENTER_Y

# ****************************************************************
# Repair Station Spawn
# Just make the Repair far enough from the last bots
x_rs=$(echo "$origin_x - $uniform_model_clearance - 2.0" | bc)
y_rs=$(echo "$origin_y - $uniform_model_clearance - 2.0" | bc)
yaw_rs=$(echo "scale=3;3.14*$SRCP2_SEED_FACTOR / 32767" | bc)

pose_rs="-x $x_rs -y $y_rs -z 0.65 -R 0 -P 0 -Y $yaw_rs"
if ! roslaunch  srcp2_launch repair_station.launch init_pose:="$pose_rs"; then
    echo -e "$echo_error error in repair station launch"
else
    echo -e "$echo_ok repair station complete"
fi   
# ****************************************************************
#  Processing Plant Spawn Spawn
# Just make the Processing plant far enough from the last repair station
x_pp=$(echo "$origin_x - $uniform_model_clearance - 2.0"    | bc)
y_pp=$(echo "$origin_y - $uniform_model_clearance + 11.0"    | bc)
yaw_pp=$(echo "scale=3; 1.57+0.125*3.14*$SRCP2_SEED_FACTOR / 32767" | bc)

pose_pp="-x $x_pp -y $y_pp -z 0.45 -R 0 -P 0 -Y $yaw_pp"
if ! roslaunch  srcp2_launch processing_plant.launch init_pose:="$pose_pp"; then
    echo -e "$echo_error error in processing plant launch"
else
    echo -e "$echo_ok processing plant complete"
fi    
exit 0