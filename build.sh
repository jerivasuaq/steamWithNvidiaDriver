#!/bin/sh

IMAGE_NAME=steam_with_nvidia_driver2
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-352.79.run  # path to nvidia driver

cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
docker build -t ${IMAGE_NAME} .




