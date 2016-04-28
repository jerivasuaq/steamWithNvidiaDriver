#!/bin/sh

COMMAND=/bin/bash
#COMMAND="steam"

SND="--group-add audio --device /dev/snd "
DBUS="-v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm"



#PULSE="--link pulseaudio:pulseaudio -e PULSE_SERVER=pulseaudio "
NET="--net host "
NET=""

mkdir -p $HOME/steam

xhost + # allow connections to X server
docker run \
	-ti --rm \
	-v /etc/machine-id:/etc/machine-id:ro \
	-v /var/run/dbus:/var/run/dbus \
	$NET \
	--cpuset-cpus 1 \
	--memory 1024mb \
	--privileged \
	-e DISPLAY=unix$DISPLAY \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
	$SND \
	$DBUS \
	$PULSE \
	-v="$HOME/steam:/home/steam"  \
	steam_with_nvidia_driver2 $COMMAND

	
