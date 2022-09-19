#! /usr/bin/env bash
#
# Space Robotics Challenge 2: NASA-JSC
# Copyright (c) 2020, All Rights Reserved
#
# This is a simple script to validate the xacro files. ROS is assumed to be
# installed
#
# Notes: 
# 1. rospack does _not_ work on the host system. Because the workspace is 
#    compiled in a docker image, this means that the ROS_PACKAGE_PATH generated
#    by 'source ros_workspace/devel/setup.bash' is relative to the docker container's
#    filesystem
#
# 2. You will also need to install: liburdfdom-tools in addition to the usual ROS
#    install
#
_this_dir="$( cd "$(dirname "$0")" ; pwd -P )"
pushd `pwd` > /dev/null 2>&1
cd $_this_dir
cd ../../ # move to ros-workspace

function help() {
    echo -e "Validator for XACRO and Models
    
    Options:
        -p ROS package (optional, use if name is not unique)

        -m
            model filename
    "
}

package=""
model="no-such-path"
while getopts m:p:h arg; do
    case $arg in
        h)
            help
            exit 0
            ;;
        p)
            package=$OPTARG
            ;;
        m)
            model=$OPTARG
            echo "looking for model \"$model\""
            ;;
    esac
done
        
path=`find $(pwd) -name $model | grep ros_workspace/src | grep "$package"`
if [ ! $? ]; then
    echo "cannot find xacro model \"$pkg\""
    exit 1
fi
if [ ! -e $path ] || [ -z $path ]; then
    echo "cannot find file at path \"$path\""
    exit 1
fi
echo "have model at: \"$path\""

# generate URDF from xacro
out=/tmp/$model.urdf
echo "DBG *** Processing model \"$path\" to \"$out\""
if ! rosrun xacro xacro --verbosity=4 $path -o $out; then
    echo "cannot convert xacro to urdf"
    exit 1
fi
echo "have generated urdf at \"$out\""

# check the urdf
check_urdf $out
if [ ! $? ]; then
    echo "urdf check failed"
    exit 1
fi
echo "urdf is OK"

# check the sdf
gz sdf -p $out
if [ ! $? ]; then
    echo "sdf check of \"$out\" failed"
    exit 1
fi
echo
echo
echo "sdf is OK"
exit 0
