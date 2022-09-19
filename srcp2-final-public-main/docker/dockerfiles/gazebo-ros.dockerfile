#
# Space Robotics Challenge 2: NASA JSC
# Final Round
#
# Copyright (c), 2019-2022 NASA-JSC. All Rights Reserved
# Unauthorized Distribution Strictly Prohibited
#
FROM gazebo:gzserver11-focal
#
ARG enduser_name="srcp2"
ARG enduser_group="srcp2"
#
ARG enduser_uid="1001"
ARG enduser_gid="1001"
#
ENV HOME="/home/${enduser_name}"

# ======================================================================================================================
# RUN AS ROOT

# Install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    locales \
    bash-completion \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# finish environment setup
RUN locale-gen en_US.UTF-8 
ENV LANG en_US.UTF-8

# quiet the xdg runtime directory warning
ARG XDG_RUNTIME_DIR="/tmp/xdg_runtime_dir"
RUN mkdir -p ${XDG_RUNTIME_DIR} && chmod 777 ${XDG_RUNTIME_DIR}
ENV XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR}

# ROS/Gazebo envs
ENV ROS_MASTER_URI="http://localhost:11311"
ENV QT_X11_NO_MITSHM=1
ENV IGN_IP="127.0.0.1"
#
# setup ROS keys and sources.list for melodic install
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' \
    --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > \
    /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    libgazebo11-dev \
    bc

# bootstrap rosdep
RUN rosdep init && rosdep update

# install competitor ros packages
# also some common general packages
ENV ROS_DISTRO noetic
RUN apt-get update && apt-get install -y \
    ros-noetic-ros-core \
    ros-noetic-ros-base \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-robot-state-publisher \
    ros-noetic-gazebo-ros-control \
    ros-noetic-velocity-controllers \
    ros-noetic-position-controllers \
    ros-noetic-joint-state-publisher \
    ros-noetic-joint-state-controller \
    ros-noetic-compressed-image-transport \
    ros-noetic-rviz \
    ros-noetic-rqt \ 
    #ros-noetic-rqt-common-plugins \ # This creats an anoying bug where it asks for your keyboard type but doesn't seem to accept input from user
    ros-noetic-stereo-image-proc \
    ros-noetic-xacro \
    imagemagick \
    python3-pip \ 
    vim \
    nano \
    tree \
    \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# necessary for heightmap generation
RUN pip3 install Pillow

# runtime stuff: bash and entrypoint scripts
RUN mkdir -p ${HOME}/scripts
COPY docker/scripts/srcp2_setup.bash ${HOME}/scripts
COPY docker/scripts/container/competitor-entrypoint.bash ${HOME}/scripts/competitor-entrypoint.bash
COPY docker/scripts/container/common-entrypoint.bash ${HOME}/scripts/common-entrypoint.bash
#
# runtime stuff: config parsing
RUN mkdir -p /${HOME}/config
COPY docker/scripts/container/config_parsing.py    ${HOME}/config/config_parsing.py
COPY docker/scripts/container/config_defaults.yaml ${HOME}/config/config_defaults.yaml

# Users and Group Creation
RUN if id ${enduser_name}; then userdel -f ${enduser_name}; fi &&\
    if getent group ${enduser_group}; then groupdel ${enduser_group}; fi &&\
    \
    groupadd -g ${enduser_gid} ${enduser_group} &&\
    useradd -l -u ${enduser_uid} -g ${enduser_group} ${enduser_name} -d ${HOME}

RUN chown --changes --silent --no-dereference --recursive \
    ${enduser_uid}:${enduser_gid} \
    /home/${enduser_name}

# ======================================================================================================================
# NVIDIA SUPPORT (still root)

# container's nvidia driver
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# nvidia-container-runtime
# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,utility,compute,display
# ======================================================================================================================
# RUN AS END-USER
#
USER ${enduser_name}
ENV HOME="/home/${enduser_name}"

RUN mkdir -p ${HOME}/scripts       && \
    mkdir -p ${HOME}/ros_workspace && \
    mkdir -p ${HOME}/logs          && \
    mkdir -p ${HOME}/.ros          && \
    mkdir -p ${HOME}/.gazebo

ENV ROS_HOME="${HOME}/.ros"
#
VOLUME "${HOME}/.gazebo"
VOLUME "${HOME}/.ros"
VOLUME "${HOME}/logs"
