FROM ubuntu:22.04

############################## SYSTEM PARAMETERS ##############################

## base arguments
ARG USER=initial
ARG GROUP=inital
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash

## setup user and group parameter
RUN groupadd --gid ${GID} ${GROUP} \
  && useradd --gid ${GID} --uid ${UID} -ms ${SHELL} ${USER} \
  && mkdir -p /etc/sudoers.d \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
  && chmod 0440 "/etc/sudoers.d/${USER}"

# changing the source of information and listings for software
RUN sed -i 's@archive.ubuntu.com@ftp.tku.edu.tw/@g' /etc/apt/sources.list

############################### INSTALL & SETUP ###############################

## install packages
RUN apt update \
  && apt install -y --no-install-recommends \
  sudo \
  terminator \
  && apt clean \
  && rm -rf /var/lib/apt/lists

## copy entrypoint script in image
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

## setup terminator config
# COPY ./config/shell/terminator_config /etc/xdg/terminator/config

## switch image workspace to user home folder
WORKDIR /home/${USER}

## switch container user to ${USER}
USER ${USER}

## things to do when docker run
ENTRYPOINT ["/entrypoint.sh", "terminator"]
