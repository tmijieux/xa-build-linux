#!/bin/bash

set -e
set -x

cd $(dirname $0)
CURDIR=$(pwd)

# the BUILD_HOME variable must match the one used when building xamarin-android in the run.sh script at root of this git repository
BUILD_HOME=${HOME}/xa-home
SOURCE_DIR=${CURDIR}/src

docker build -t xa-build-myapp .

docker run -it --rm \
       -v ${SOURCE_DIR}:/src \
       -v ${BUILD_HOME}:/home/builduser/ \
       xa-build-myapp:latest

