#!/bin/bash

set -x
XAMARIN_DIR=/home/builduser/xamarin-android
APP=MyApp
APPDIR=/src/${APP}.Droid
APPPROJ=${APPDIR}/${APP}.Droid.csproj
cd ${APPDIR}

${XAMARIN_DIR}/bin/Debug/bin/xabuild \
              /t:SignAndroidPackage \
              /p:Configuration=Debug \
              /restore \
              /clp:disableconsolecolor \
              ${APPPROJ}

