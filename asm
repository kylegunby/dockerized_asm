#!/usr/bin/env bash

IMAGE_NAME=asm_nasm
CMD=$1
FILE=$2

# Functions
function assemble() {
  docker run -it -v ./src:/root/src $IMAGE_NAME \
    nasm -f elf32 -o $OUTPUT_NAME.o $FILE
}

function link() {
  docker run -it -v ./src:/root/src $IMAGE_NAME \
    ld -m elf_i386 $OUTPUT_NAME $FILE
}

# Control flow
case $CMD in
  "build")
    docker build -t $IMAGE_NAME .
    ;;
  "shell")
    docker run -it \
      -v ./src:/root/src \
      -v ./bin:/root/bin \
      $IMAGE_NAME bash
    ;;
  "assemble")
    docker run -it \
      -v ./src:/root/src \
      -v ./bin:/root/bin \
      $IMAGE_NAME \
      nasm -f elf32 -o bin/$FILE.o src/$FILE.asm
    ;;
  "link")
    docker run -it \
      -v ./src:/root/src \
      -v ./bin:/root/bin \
      $IMAGE_NAME \
      ld -m elf_i386 -o bin/$FILE bin/$FILE.o
    ;;
  "run")
    docker run -it \
      -v ./bin:/root/bin \
      $IMAGE_NAME \
      ./bin/$FILE 
esac

