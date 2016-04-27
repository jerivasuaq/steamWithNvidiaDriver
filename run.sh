#!/bin/sh

COMMAND=/bin/bash
#COMMAND="steam"

SND="--device /dev/snd -v /dev/shm:/dev/shm -v /run/user/$UID/pulse/native:/tmp/pulse "
#  
mkdir -p $HOME/steam

xhost + # allow connections to X server
docker run \
	-ti --rm \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /var/run/dbus:/var/run/dbus \
	--net host \
	--cpuset-cpus 1 \
	--memory 1024mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	$SND \
	-v="$HOME/steam:/home/steam"  \
	steam_with_nvidia_driver2 $COMMAND

	
