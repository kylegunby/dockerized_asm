# Dockerized ASM
This is a very basic repo for learning ASM without needing to install any tools (outside of docker).
This is mostly for experimentation and if you want to truly learn ASM, I would recommend learning how to
assemble and link asm files instead of just using these commands.


## Setup
Getting started is simple:
- Clone the repo
- Create a `.asm` file in the `src` directory (there is an example in src already)
- Build the image: `./asm build`
- Assemble: `./asm assemble hello_world` (the file extension is not needed)
- Link: `./asm link hello_world`
- Run: `./asm run hello_world`

You can also hop into a bash shell with `./asm shell`

## Environment
The Docker image uses the latest alpine release.
Packages installed include:
- vim
- bash
- nasm
- gcc
- clang
- gdb
- valgrind
- make
- perl
- man-pages
- less
- tree

