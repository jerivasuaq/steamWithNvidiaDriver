#!/bin/sh

COMMAND=/bin/bash

mkdir -p $HOME/steam

xhost + # allow connections to X server
docker run \
	-ti --rm \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /var/run/dbus:/var/run/dbus \
	--net host \
	--cpuset-cpus 0 \
	--memory 512mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	--device /dev/snd \
	-v="$HOME/steam:/home/steam"  \
	steam_with_nvidia_driver $COMMAND

