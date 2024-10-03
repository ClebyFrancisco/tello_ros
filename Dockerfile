FROM ros:foxy

# Set environment variable to avoid dialog prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git

RUN apt update && apt install -y python3-pip \
                                 python3-rosdep \
                                 python3-rosinstall \
                                 python3-rosinstall-generator \
                                 python3-wstool \
                                 build-essential 

RUN apt install -y gazebo11 libgazebo11 libgazebo11-dev 

RUN apt install -y ros-foxy-cv-bridge ros-foxy-camera-calibration-parsers

RUN apt install -y libasio-dev

RUN apt install -y libignition-rendering3

RUN pip3 install transformations

RUN apt install -y ros-foxy-gazebo-ros-pkgs

RUN mkdir -p ~/tello_ros_ws/src && cd ~/tello_ros_ws/src && git clone https://github.com/FelipMa/tello_ros2_packages.git

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && cd ~/tello_ros_ws && colcon build --event-handlers console_direct+
RUN cd ~/tello_ros_ws && rosdep install --from-paths src -y --ignore-src

#  Source environments
RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc

# Entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]