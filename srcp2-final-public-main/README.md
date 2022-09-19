# Space Robotics Challange: Phase 2

Copyright (c) NASA-JSC 2020/2021. All Rights Reserved

Unauthorized Distribution Strictly Prohibited

## Summary

> The Space Robotics Challenge (SRC) is a virtual competition to advance robotic software
> and autonomous capabilities for space exploration missions on the surface of
> extraterrestrial objects, such as distant planets or moons.
> 
> The objective of Phase 2 is to find solutions to allow a heterogeneous, multi-robot
> team to autonomously complete tasks envisioned for a lunar in-situ resource
> utilization (ISRU) mission. This challenge will require competitors to develop
> software that allows a virtual team of robotic systems (i.e. virtual robotic team)
> to operate autonomously to successfully achieve these tasks.
 
This repository contains code for competitors to launch and develop the SRCP2 Final Competetion simulation

- For full documentation, see [The Wiki](https://gitlab.com/scheducation/srcp2-final-public/-/wikis/home)
- To submit errors and tickets, please read the relevant [Wiki Page](https://gitlab.com/scheducation/srcp2-final-public/-/wikis/home) and submit a ticket [here](https://gitlab.com/scheducation/srcp2-final-public/issues).

## Repository Contents

Have you read [The Wiki](https://gitlab.com/scheducation/srcp2-final-public/-/wikis/home)? (please, do read the wiki!)

- __root_folder__
    - helper shell scripts for installation guidance etc.
- __.gitlab__ 
    - repo meta
- __docker__
    - `/scripts` has the shell script to perform tasks such as run/build/submit solution etc.
    - `/dockerfiles` has the dockerized building scripts as reference information for competitors.
- __ros_workspace__
    - the SRCP2 ROS workspace, containing release versions of the simulations custom ROS messages
    - to use these for ROS command line tools (such as `rostopic`), run `source ros_workspace/install/setup.bash`
    - to link against these for building ROS nodes, include these ROS packages in your workspace
- __cmp_workspace__
    - the Template ROS workspace, for solutions and competitors workspace.
    - the example/demo solution project is include in source form that works with simulation.