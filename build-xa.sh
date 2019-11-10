#!/bin/bash
set -x
set -e
cd /home/builduser
git clone https://github.com/tmijieux/xamarin-android.git || true
cd xamarin-android
make prepare
make
