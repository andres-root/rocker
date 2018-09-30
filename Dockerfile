FROM ubuntu:18.04
MAINTAINER Your Name <info@andresroot.co>
RUN apt-get update
RUN apt-get upgrade -y
RUN ssh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install ros-kinetic-desktop-full
