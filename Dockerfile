ARG GO_VERSION=1.17.6

FROM golang:${GO_VERSION}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && \
    apt-get -qq upgrade -y && \
    apt-get -qq install -y --no-install-recommends jq curl git vim sudo unzip xz-utils bzip2

COPY *.sh config.txt /

ENV DESTDIR=/dl

ENV GO111MODULE=on
