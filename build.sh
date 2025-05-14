#!/bin/sh

DIR="build/"

build() {
    if [ -z "$(ls -A .)" ]; then
        echo "Build directory is empty genrating build files and running make..."
        cmake .. -DCMAKE_BUILD_TYPE=$1 -DCMAKE_CXX_COMPILER=clang++

        make
    else
        echo "Build directory is not empty running make..."
        make
    fi
}

if [ -d "$DIR" ]; then
    cd "$DIR"
    build "$1"
else
    echo "build directory does not exist. creating build directory..."
    mkdir -p "$DIR"
    cd "$DIR"
    build "$1"
fi
