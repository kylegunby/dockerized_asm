FROM alpine:latest

WORKDIR /root

RUN apk add vim bash nasm gcc clang gdb valgrind \
    make perl man-pages less tree && \
    rm -rf /var/cache/apk/*

