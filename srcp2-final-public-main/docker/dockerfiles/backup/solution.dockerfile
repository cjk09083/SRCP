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
ARG os_apps="boxes figlet" 

# Python Plugins
ARG py_apps="flask" 
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
#######################################lds######################################
COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/build ${HOME}/cmp_workspace/build/
COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/devel ${HOME}/cmp_workspace/devel/
#COPY --chown=${enduser_name}:${enduser_name} cmp_workspace/ts ${HOME}/cmp_workspace/ts/


####################rtabmap install###################
USER root
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y keyboard-configuration

RUN apt-get update && apt-get install -y \
       ros-noetic-rtabmap \
       ros-noetic-rtabmap-ros \
       && rm -rf /var/lib/apt/lists/

####################rtabmap install end###############
#RUN wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda_11.0.2_450.51.05_linux.run && \
#    sh cuda_11.0.2_450.51.05_linux.run


#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin \
#    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 \
#    wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb \
#    dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb \
#    apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub \ 
#    apt-get update && apt-get -y install cuda



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
