#! /usr/bin/env bash
#
# Space Robotics Challenge 2: NASA-JSC
# Copyright (c) 2020, All Rights Reserved
#
# Simple script to validate input mesh
#
# Mesh import rule of thumb:
#    - in xacro: give path from the ROS package root
#    - in env var: give path to ROS package root

mesh_target=$1

mesh_test_world="
<?xml version="1.0"?>
<sdf version="1.4">
  <world name="default">
    <include>
      <uri>model://ground_plane</uri>
    </include>
    <include>
      <uri>model://sun</uri>
    </include>
    <model name="my_mesh">
      <pose>0 0 0  0 0 0</pose>
      <static>true</static>
      <link name="body">
        <visual name="visual">
          <geometry>
            <mesh>
                <uri>model://rovers/meshes/small/small_basic/${mesh_target}</uri>
            </mesh>
          </geometry>
        </visual>
      </link>
    </model>
  </world>
</sdf>
"
export GAZEBO_MODEL_DATABASE_URI="" # please, skip looking online, we really don't care
export GAZEBO_MODEL_PATH="$(rospack find srcp2_models_final)"

tmp_out="/tmp/srcp2-mesh-test.world"
if [ -f $tmp_out ]; then
    rm $tmp_out;
fi

echo "${mesh_test_world}" >> $tmp_out
gazebo --verbose $tmp_out