#!/bin/bash

set -x
set -e
cd $(dirname $0)

BUILD_HOME=${HOME}/xa-home
mkdir -p ${BUILD_HOME}

docker build -t xa-build .

docker run -it --rm \
    -v ${BUILD_HOME}:/home/builduser \
    --name xa-build \
    xa-build
