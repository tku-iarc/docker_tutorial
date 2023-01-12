#!/usr/bin/env bash

# Get parameter from system
user=$(id -un)
group=$(id -gn)
uid=$(id -u)
gid=$(id -g)

# Get script path
file_dir=$(dirname $0)

# docker buildkit tool
export DOCKER_BUILDKIT=1

docker build \
    --build-arg USER=$user \
    --build-arg UID=$uid \
    --build-arg GROUP=$group \
    --build-arg GID=$gid \
    --build-arg HOME=$HOME \
    -f $file_dir/Dockerfile \
    -t test \
    $file_dir

#   --progress=plain \
    # --no-cache \
