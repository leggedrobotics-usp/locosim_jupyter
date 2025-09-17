#!/bin/bash

CONTAINER_NAME=leggedroboticsusp/locosim
CONTAINER_TAG=jupyter-v0.2
CONTAINER_IMAGE=$CONTAINER_NAME:$CONTAINER_TAG

# Host paths
HOST_USER_HOME=$(pwd)/$USER
HOST_WORKDIR=$HOST_USER_HOME/ros_ws/src
HOST_LOCOSIMDIR=$HOST_WORKDIR/locosim

if docker image inspect "$CONTAINER_IMAGE" >/dev/null 2>&1; then
    echo "Image $CONTAINER_IMAGE found locally, skipping pull."
else
    echo "Pulling $CONTAINER_IMAGE docker image..."
    docker pull $CONTAINER_IMAGE
fi
# docker build --no-cache -f Dockerfile -t $CONTAINER_IMAGE .

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