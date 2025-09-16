#!/bin/bash
xhost +local:docker

docker run --rm -it \
    --gpus all \
    --runtime=nvidia \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
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
    locosim_jupyter:0.1