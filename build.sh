#!/bin/bash


if [ -f /etc/debian_version ]; then
    echo "Debian"
    sudo apt-get update
    sudo apt-get install -y libsdl2-dev
elif [ -f /etc/arch-release ]; then
    echo "Arch"
    sudo pacman -S --noconfirm sdl2
else
    echo "nope"
	exit
fi


git submodule init &&\
 git submodule update &&\
cmake . -DSDL2_DIR='./src/lib/SDL2-2.28.2/' &&\
 make -j$(nproc)
