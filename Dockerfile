FROM alpine:3.10 AS builder

RUN apk add -u wget build-base autoconf automake ca-certificates \
               tar xz unzip libtool

RUN wget https://github.com/rtCamp/httperf/archive/master.zip && \
    unzip master.zip && \
    cd httperf-master && \
    autoreconf -i && \
    ./configure && \
    make


FROM alpine:3.10

COPY --from=builder /httperf-master/src/httperf /usr/local/bin/
