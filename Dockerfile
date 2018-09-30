FROM ubuntu:18.04
MAINTAINER Andres Root <info@andresroot.co>

# Begin installation
RUN apt-get update
RUN apt-get upgrade -y

# Install dependencies
RUN apt-get install -y ssh
RUN apt-get install -y gnupg gnupg1 gnupg2
RUN apt-get install -y lsb-release

# Add repository to software sources
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update
RUN apt-get upgrade -y

# Add TZ data info
ENV TZ=America/Bogota
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install ROS 
RUN apt-get install -y ros-melodic-desktop-full
RUN rosdep init
RUN rosdep update
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc

# ROS post install dependencies
RUN apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

CMD ["/bin/bash"]
# End installation
