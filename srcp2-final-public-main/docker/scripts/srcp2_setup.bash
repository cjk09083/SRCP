#! /usr/bin/env bash
#
# Space Robotics Competition 2: NASA JSC
# Copyright (c), 2019-2022. All Rights Reserved
#
# This is a useful script for storing names, volumes and other common items

r="\e[31m" # red
g="\e[32m" # green
y="\e[33m" # yellow
b="\e[94m" # blue
c="\e[34m" # cyan
rs="\e[0m" # reset to default 
B="\e[1m"  # bold text

# some echoing options for clarity
echo_dbg="${B}${y}dbg${rs}:"
echo_info="${B}${b}inf${rs}:"
echo_ok="${B}${g}ok${rs}: "
echo_warn="${B}${y}wrn${rs}:"
echo_error="${B}${r}err${rs}:"


function echo_header(){
  echo -e "$B
________________________________________________________________________________________________________________________

 Space Robotics Challange, Phase 2
 Final Round

 Copyright (c) 2019-2022, NASA-JSC, All Rights Reserved
________________________________________________________________________________________________________________________${rs}
"
}

# Return to the original working dir and exit the script with $1 value
#
function quit_with_popd() {
    popd > /dev/null 2>&1
    exit $1
}

# must input y to return true, else returns 1
#
function prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) echo -e "$echo_error invalid input \"$REPLY\", please answer \"y\" or \"n\""
    esac 
  done  
}