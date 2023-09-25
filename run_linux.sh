#!/bin/bash

docker run --rm -it  \
	--user=$(id -u):$(id -g) \
	--env USER  \
	--env HOME \
	--env SHELL \
	--env DOCKER=1  \
	--env DISPLAY \
	--env QT_X11_NO_MITSHM=1 \
	-p 8888:8888 \
	--volume "/etc/group:/etc/group:ro" \
	--volume "/etc/passwd:/etc/passwd:ro" \
	--volume "/etc/shadow:/etc/shadow:ro" \
	--volume "/etc/sudoers.d:/etc/sudoers.d:ro" \
	--volume "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume "$(pwd)/$USER:$HOME:rw" \
	--entrypoint bash \
	--name locosim_jupyter \
	locosim_jupyter:0.1