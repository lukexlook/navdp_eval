#!/bin/bash

# export DISPLAY=":1"
# export GPU_ID=0

xhost +local:root
docker run -it --rm                     \
    --gpus device=${GPU_ID}             \
    -e "DISPLAY=${DISPLAY}"             \
    -v /tmp/.X11-unix/:/tmp/.X11-unix   \
    navdp:base3_lab_install
