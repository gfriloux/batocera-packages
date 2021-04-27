#!/usr/bin/env bash

set -ex

mkdir -p ./rootdir/userdata/roms/ports/{data/supertuxkart,.data/SuperTuxKart}

if [ ! -e ./rootdir/userdata/roms/ports/data/supertuxkart/thumbnail.png ]; then
  wget    https://linuxh2o.com/wp-content/uploads/2020/07/LinuxH2O-Thumbnail-e1595873327214.png \
       -O ./rootdir/userdata/roms/ports/data/supertuxkart/thumbnail.png
fi

if [ ! -e ./rootdir/userdata/roms/ports/data/supertuxkart/video.webm ]; then
  wget    https://linuxreviews.org/images/4/49/SuperTuxKart-v1-multiplayer.1080p.webm \
       -O ./rootdir/userdata/roms/ports/data/supertuxkart/video.webm
fi

if [ ! -e SuperTuxKart-1.2-linux.tar.xz ] && [ ! -e SuperTuxKart-1.2-linux.tar ]; then
  wget https://github.com/supertuxkart/stk-code/releases/download/1.2/SuperTuxKart-1.2-linux.tar.xz
fi

if [ -e SuperTuxKart-1.2-linux.tar.xz ]; then
  xz -d SuperTuxKart-1.2-linux.tar.xz
fi

tar x -f SuperTuxKart-1.2-linux.tar
mv SuperTuxKart-1.2-linux ./rootdir/userdata/roms/ports/.data/SuperTuxKart

cd rootdir
batocera-makepkg
