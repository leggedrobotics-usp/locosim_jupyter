#!/bin/bash

CONTAINER_HOME=/home_locosim_jl/$USER
WS_SRC_FOLDER=$CONTAINER_HOME/catkin_ws/src
SPLITED_ONE=($(echo $1 | tr "-" "\n"))

echo "source /opt/ros/${SPLITED_ONE[0]}/setup.bash" >> $CONTAINER_HOME/.bashrc

mkdir -p $WS_SRC_FOLDER

echo "This may take a while... Downloading needed packages' repositories..."

git clone -b master https://github.com/catkin/catkin_simple.git $WS_SRC_FOLDER/catkin_simple

echo "Building $1 docker image..."

./docker/build.sh $1

