#!/bin/bash

CONTAINER_NAME=locosim_jupyter
CONTAINER_TAG=1.0
CONTAINER_IMAGE="$CONTAINER_NAME:$CONTAINER_TAG"
# locosim_jupyter:1.0

echo $CONTAINER_IMAGE
if [[ "$(docker images -q $CONTAINER_IMAGE 2> /dev/null)" == "" ]]; then
	echo "Building $1 docker image..."
	docker build -f Dockerfile -t $CONTAINER_IMAGE:1.0 .
fi

# Host paths
HOST_USER_HOME=$(pwd)/$USER
HOST_WORKDIR=$HOST_USER_HOME/ros_ws/src

# Container paths
CONTAINER_USER_HOME=/home/$USER
CONTAINER_WORKDIR=$CONTAINER_USER_HOME/ros_ws/src
CONTAINER_LOCOSIM=$HOST_WORKDIR/locosim

# create HOST_WORKDIR
mkdir -p $HOST_WORKDIR

BASHRC=$HOST_USER_HOME/.bashrc
if [ ! -f "$BASHRC" ]; then
    echo "$BASHRC does not exist."
    cp .bashrc $HOST_USER_HOME/.bashrc
fi

# Creating useful folders in host
if [ ! -d "$CONTAINER_LOCOSIM" ]; then
	echo "creating $CONTAINER_LOCOSIM"
	git clone https://github.com/gbrlb/locosim.git -b jupyter --recursive $CONTAINER_LOCOSIM
fi

docker run --rm -it  \
	-u $(id -u):$(id -g) \
	-e USER  \
	-e HOME \
	-e SHELL \
	-e "DOCKER=1"  \
	-e "DISPLAY" \
	-e "QT_X11_NO_MITSHM=1" \
	--network=host \
	--privileged  \
	--volume="/etc/group:/etc/group:ro"   \
	--volume="/etc/passwd:/etc/passwd:ro" \
	--volume="/etc/shadow:/etc/shadow:ro"  \
	--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
	--volume $HOST_USER_HOME:$HOME:rw \
	--device=/dev/dri:/dev/dri  \
	--workdir="$CONTAINER_WORKDIR" \
	--name="$CONTAINER_NAME" \
	--entrypoint bash \
	$CONTAINER_IMAGE