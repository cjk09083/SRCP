#!/usr/bin/env python3
"""
SRCP2 Heightmap Filters
Copyright (c) NASA-JSC 2020, 2021
All Rights Reserved
Unauthorized Distribution Strictly Prohibited

This script assembles the world file from the inputs
"""
import subprocess
import os
import rospkg


def _get_basic_world(world_file):
    """
    get the sdf of the world file as a string
    """
    if not os.path.isfile(world_file):
