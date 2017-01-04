FROM alpine:3.3

WORKDIR /usr/src

RUN apk add --update --no-cache --virtual=.build-dependencies \
            wget \
            ca-certificates \
            tar \
            xz \
            unzip \
            libtool \
            build-base \
            autoconf \
            automake \
            make && \
    wget https://github.com/rtCamp/httperf/archive/master.zip && \
    unzip master.zip && \
    mkdir /usr/src/httperf-master/build && \
    cd httperf-master && \
    autoreconf -i && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf httperf-master /usr/src/master.zip && \
    apk del .build-dependencies
