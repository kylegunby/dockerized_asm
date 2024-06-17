#!/usr/bin/env bash

IMAGE_NAME=asm_nasm
CMD=$1

case $CMD in
  "build")
    docker build -t $IMAGE_NAME .
    ;;
  "shell")
    docker run -it -v ./src:/root/src $IMAGE_NAME bash
    ;;
esac

