FROM afdaniele/libbot2-ros:latest

# set working directory
RUN mkdir -p /code/src/respeaker_ros
WORKDIR /code

# install pip
RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt install -y \
  python-pip \
  python-catkin-tools \
  portaudio19-dev \
  ros-${ROS_DISTRO}-audio-common-msgs && \
  # clear cache
  rm -rf /var/lib/apt/lists/*

# copy requirements
COPY ./requirements.txt /tmp/requirements.txt

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

# copy code
COPY ./ /code/src/respeaker_ros

# build ROS package
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && \
  catkin build
