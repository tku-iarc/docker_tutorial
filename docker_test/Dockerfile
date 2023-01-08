ARG VERISON=22.04

FROM ubuntu:$VERISON

LABEL org.opencontainers.image.authors="cyc <cyc@example.com>"

RUN apt update

COPY ./entrypoint.sh /

ENV SYSTEM_NAME=ubuntu

ENTRYPOINT ["/entrypoint.sh"]
