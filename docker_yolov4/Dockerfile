FROM ubuntu:20.04

############################## SYSTEM PARAMETERS ##############################

## basic arguments
ARG USER=initial
ARG GROUP=inital
ARG UID=1000
ARG GID=$UID
ARG SHELL=/bin/bash
ARG HOME=/home/$USER

## setup user and group parameter
RUN groupadd --gid $GID $GROUP \
  && useradd --gid $GID --uid $UID -ms $SHELL $USER \
  && mkdir -p /etc/sudoers.d \
  && echo "$USER ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USER" \
  && chmod 0440 "/etc/sudoers.d/$USER"

## changing the source of information and listings for software
RUN sed -i 's@archive.ubuntu.com@ftp.tku.edu.tw/@g' /etc/apt/sources.list

## setup container time zone
ENV TIME_ZONE=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime \
  && echo $TIME_ZONE > /etc/timezone
############################### INSTALL & SETUP ###############################

## install packages
RUN apt update \
  && apt install -y --no-install-recommends \
  # basic tool
  sudo \
  curl \
  git \
  # shell
  terminator \
  # basic dependencies
  python3 \
  python3-pip \
  python3-dev \
  build-essential \
  # mebay is windows dep
  libgl1-mesa-glx \
  libxcb-xinerama0 \
  libsm6 \
  # google coral USB
  gnupg \
  && apt clean \
  && rm -rf /var/lib/apt/lists

## copy entrypoint script in image
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

## switch image workspace to $HOME
WORKDIR $HOME

## copy all env setup config
COPY ./config .config

# install google coral Accelerator
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" \
  | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
  && apt update \
  && apt install -y --no-install-recommends \
  libedgetpu1-std \
  python3-pycoral \
  && apt clean \
  && rm -rf /var/lib/apt/lists

## setup yolo dependent
RUN python3 -m pip install --upgrade --force-reinstall pip \
  && pip3 install -r .config/pip/requirements.txt

## switch container user to $USER
USER $USER

RUN sudo mkdir work
# RUN mkdir work
WORKDIR ./work

## things to do when docker run
ENTRYPOINT ["/entrypoint.sh", "terminator"]
# ENTRYPOINT ["/entrypoint.sh", "bash"]
