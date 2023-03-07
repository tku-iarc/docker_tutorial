#!/usr/bin/env bash

docker run --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=${DISPLAY} \
    -it test
