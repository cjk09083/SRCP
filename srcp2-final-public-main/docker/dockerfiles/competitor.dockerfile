#
# Space Robotics Challenge 2: NASA JSC
# Final Round
#
# Copyright (c), 2019-2022 NASA-JSC. All Rights Reserved
# Unauthorized Distribution Strictly Prohibited
#
ARG base_image="final_gazebo_ros"
FROM ${base_image}
ARG enduser_name="srcp2"

USER root
RUN apt-get update && apt-get install -y \
    vim \
    nano \
    tree  \
    x11-apps \
    iputils-ping \
    net-tools \
    python3-rosinstall \
    build-essential \
    liburdfdom-tools \
    python3-catkin-tools && \
    \
    pip3 install osrf-pycommon

# make sure that we are _not_ root at this time!
USER ${enduser_name}

# copy in the "binary" versions of all the ROS packages
RUN mkdir -p ${HOME}/ros_workspace/install
COPY --chown=srcp2:srcp2 ros_workspace/install ${HOME}/ros_workspace/install/
RUN chmod +x ${HOME}/ros_workspace/install/share/srcp2_launch/scripts/team_spawner.bash

# make sure entrypoint exists
COPY docker/scripts/container/common-entrypoint.bash ${HOME}/scripts
COPY docker/scripts/container/competitor-entrypoint.bash ${HOME}/scripts

# starting conditions (note: CMD not ENTRYPOINT for --interactive override)
ENV COMPETITOR_ENTRYPOINT="${HOME}/scripts/competitor-entrypoint.bash"
CMD ${COMPETITOR_ENTRYPOINT}