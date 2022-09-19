#
# Space Robotics Challenge 2: NASA JSC
# Final Round
#
# Copyright (c), 2019-2022 NASA-JSC. All Rights Reserved
# Unauthorized Distribution Strictly Prohibited
#
ARG base_image="final_competitor"
FROM ${base_image}
# *******************************************
# ** COMPETITOR CUSTOMIZATION THIS LIST    **
# ** DELIMITED ITEMS WITH SPACE CHARACTER! **

# OS Level Apps (all will be installed root permissions)
# These boxes and figlet, flask are optional are just here as examples
ARG os_apps="curl" 

# Python Plugins
ARG py_apps="imutils" 
# ** COMPETITOR CUSTOMIZATION THIS LIST DONE **
# *********************************************

ARG enduser_name="srcp2"

USER root
# The apts
RUN apt-get update && apt-get install -y; \
    for app in $req_os_apps; do \
    apt-get install $app -y; \
    done;
# The python
RUN for py in $req_py_apps; do \
    pip3 install $py; \
    done;

# Make Home Folder Tree Proper Permissions ** THESE ARE REQUIRED **
# copy in the "binary" & src versions of all the ROS packages
# User Level 
USER ${enduser_name}
RUN mkdir -p -v /home/$enduser_name/cmp_workspace
COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/install ${HOME}/cmp_workspace/install/
COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/src ${HOME}/cmp_workspace/src/


#COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/build ${HOME}/cmp_workspace/build/

#COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/devel ${HOME}/cmp_workspace/devel/

USER root
##################cuda#########################

#CMD nvidia-smi
# nvidia-container-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add - && \
#    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list 
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y keyboard-configuration
RUN apt-get update 
#RUN apt-get install -y nvidia-driver-460
#RUN apt-get install -y cuda-11-2   
#RUN apt-get purge --autoremove -y curl \
#    && rm -rf /var/lib/apt/lists/*


ENV CUDA_VERSION 11.2.0

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    cuda-cudart-11-2=11.2.72-1 \
#    nvidia-cuda-toolkit \
#    cuda-compat-11-2 \
#    && ln -s cuda-11.2 /usr/local/cuda && \
#    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    libtinfo5\
    libncursesw5 \
    cuda-cudart-dev-11-2=11.2.72-1 \
    cuda-command-line-tools-11-2=11.2.0-1 \
    cuda-minimal-build-11-2=11.2.0-1 \
    cuda-libraries-dev-11-2=11.2.0-1 \
    cuda-nvml-dev-11-2=11.2.67-1 \
    libnpp-dev-11-2=11.2.1.68-1 \
    libnccl2=2.8.4-1+cuda11.2 \
    libnccl-dev=2.8.4-1+cuda11.2 \
    libcublas-dev-11-2=11.3.1.68-1 \
    libcusparse-dev-11-2=11.3.1.68-1 \
   && rm -rf /var/lib/apt/lists/*



ENV PATH /usr/local/cuda-11.2/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH /usr/local/cuda-11.2/lib64/${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}




ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=11.2 driver>=460"


####
#RUN apt-get update && apt-get install -y build-essential
#RUN apt-get --purge remove -y nvidia*
#ADD ./Downloads/nvidia_installers /tmp/nvidia
#RUN /tmp/nvidia/NVIDIA-Linux-x86_64-460.80.run -s -N --no-kernel-module 
#RUN rm -rf /tmp/selfgz7 
#RUN /tmp/nvidia/cuda-linux64-rel-11.2.run -noprompt
#RUN /tmp/nvidia/cuda-samples-linux-11.2.run -noprompt -cudaprefix=/usr/local/cuda-11.2 
#RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64 
#RUN touch /etc/ld.so.conf.d/cuda.conf   
#RUN rm -rf /temp/*  





##################cuda end#########################

##################rtabmapd#########################
RUN apt-get update 
RUN apt-get install -y \
       ros-noetic-rtabmap \
       ros-noetic-rtabmap-ros \
       && rm -rf /var/lib/apt/lists/
##################rtabmapd end#########################


##################moveit#########################
RUN apt-get update 
RUN apt-get install -y ros-noetic-moveit ros-noetic-trac-ik-kinematics-plugin ros-noetic-image-view ros-noetic-tf2* 
##################rtabmapd end#########################


USER ${enduser_name}


# ******************************************
# **    COMPETITOR CUSTOMIZATION HERE!    **
# The Competitor Can Add More Docker Customization Commands Here
# Refer to Docker Documentation for this.
# RUN zzz
# COPY zzz
#
# ******************************************

# Root Level Permissions
USER root
RUN chown -R "${enduser_name}:${enduser_name}" "/home/${enduser_name}";\
    ls -la "/home/${enduser_name}"

# User Level Permissions
USER ${enduser_name}

# Entrypoint and Config Copies ** THESE ARE REQUIRED **
COPY docker/scripts/container/solution-entrypoint.bash ${HOME}/scripts
COPY docker/scripts/container/config_solution.yaml ${HOME}/config

# starting conditions (note: CMD not ENTRYPOINT for --interactive override)
ENV SOLUTION_ENTRYPOINT="${HOME}/scripts/solution-entrypoint.bash"
CMD ${SOLUTION_ENTRYPOINT}
