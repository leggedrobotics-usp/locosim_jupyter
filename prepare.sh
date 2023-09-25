#!/bin/bash

CONTAINER_NAME=locosim_jupyter
CONTAINER_TAG=0.1
CONTAINER_IMAGE=$CONTAINER_NAME:$CONTAINER_TAG

# Host paths
HOST_USER_HOME=$(pwd)/$USER
HOST_WORKDIR=$HOST_USER_HOME/ros_ws/src
HOST_LOCOSIMDIR=$HOST_WORKDIR/locosim

# Container paths
if [[ "$(docker images -q $CONTAINER_IMAGE 2> /dev/null)" == "" ]]; then
	echo "Building $1 docker image..."
	docker build -f Dockerfile -t $CONTAINER_IMAGE . --progress=plain
fi

# create HOST_WORKDIR
mkdir -p "$HOST_WORKDIR"

if [ ! -f "$HOST_USER_HOME/.bashrc" ]; then
    echo "Copy .bashrc to $HOST_USER_HOME"
    cp .bashrc "$HOST_USER_HOME/.bashrc"
fi

# Creating useful folders in host
if [ ! -d "$HOST_LOCOSIMDIR" ]; then
	echo "Cloning $HOST_LOCOSIMDIR"
	git clone https://github.com/gbrlb/locosim.git -b jupyter --recursive "$HOST_LOCOSIMDIR"
fi