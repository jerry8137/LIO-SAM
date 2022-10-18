# FROM osrf/ros:kinetic-desktop-full-xenial
# FROM osrf/ros:melodic-desktop-full
FROM osrf/ros:melodic-desktop-full

ENV NVIDIA_VISIBLE_DEVICES \ 
${NVIDIA_VISIBLE_DEVICES:-all}

ENV NVIDIA_DRIVER_CAPABILITIES \
${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get -y update && apt-get install -y \
    iputils-ping \
    net-tools \
    wget \
    curl \
    build-essential \
    libgl1-mesa-dev \
    libglew-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libglm-dev \
    libfreetype6-dev \
    libglfw3-dev \
    libglfw3 \
    libglu1-mesa-dev \
    freeglut3-dev \
    openssh-server \
    python3-tk

RUN apt-get update \
    && apt-get install -y curl \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y ros-melodic-navigation \
    && apt-get install -y ros-melodic-robot-localization \
    && apt-get install -y ros-melodic-robot-state-publisher \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
    && apt-get update \
    && apt install -y libgtsam-dev libgtsam-unstable-dev \
    && rm -rf /var/lib/apt/lists/*

RUN export DISPLAY=":0.0"

# SHELL ["/bin/bash", "-c"]

# RUN mkdir -p ~/catkin_ws/src \
#     && cd ~/catkin_ws/src \
#     && git clone https://github.com/TixiaoShan/LIO-SAM.git \
#     && cd .. \
#     && source /opt/ros/kinetic/setup.bash \
#     && catkin_make
# 
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc \
    && echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

WORKDIR /root/catkin_ws
