#!/bin/bash

set -x
set -e

VOLUMEDIR=${HOME}/xa-home
mkdir -p ${VOLUMEDIR}

docker run \
    -it \
    --rm \
    -v ${VOLUMEDIR}:/home/builduser \
    --name xa-build \
    xa-build
