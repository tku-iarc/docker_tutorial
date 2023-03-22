#!/usr/bin/env bash

WS_PATH=/home/iclab/workspace/docker_tutorial_ws/

user=$(id -un)

docker run --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=${DISPLAY} \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /dev:/dev \
    --gpus all \
    -v ${WS_PATH}:/home/${user}/work \
    -it test
