#!/bin/bash
source ./prepare.sh
# Allow local docker containers to connect to the X server
xhost +local:docker

# Automatically detect NVIDIA's GPU and try to use it
if [ -z "$(lspci | grep NVIDIA)" ]; then
    USE_GPUS=""
    echo "NVIDIA's GPU WAS NOT detected."
else
    USE_GPUS="--gpus all --runtime=nvidia \
              --env=NVIDIA_VISIBLE_DEVICES=all \
              --env=NVIDIA_DRIVER_CAPABILITIES=all"
    echo "NVIDIA's GPU WAS detected. Activating GPU flags."
fi

docker run --rm -it \
    $USE_GPUS \
    --user=$(id -u):$(id -g) \
    --env="USER" \
    --env="HOME" \
    --env="SHELL" \
    --env="DOCKER=1" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$(pwd)/$USER:$HOME:rw" \
    -p 8888:8888 \
    --privileged \
    --ulimit rtprio=98:98 \
    --name locosim_jupyter \
    --entrypoint bash \
    $CONTAINER_IMAGE