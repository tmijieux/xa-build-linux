#!/bin/bash
set -x
set -e
cd /home/builduser
ls -la
git clone https://github.com/xamarin/xamarin-android.git || true
cd xamarin-android
make prepare
make
