#!/usr/bin/env bash
PROJ_NAME=$2

WORKDIR=$PWD

mkdir -p $WORKDIR/linuxdeploy
cd $WORKDIR/linuxdeploy
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
./linuxdeploy-x86_64.AppImage --appimage-extract
cd $WORKDIR

OUTPUT=out.AppImage $WORKDIR/linuxdeploy/squashfs-root/AppRun --appdir $WORKDIR/build/AppDir --output appimage