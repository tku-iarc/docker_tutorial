#!/usr/bin/env bash

workspace_path=$HOME/WorkSpace/yolo_ws

docker run --rm \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v /dev:/dev \
    -v $workspace_path:$HOME/work \
    -it test


    # -v /etc/timezone:/etc/timezone:ro \
    # -v /etc/localtime:/etc/localtime:ro \
