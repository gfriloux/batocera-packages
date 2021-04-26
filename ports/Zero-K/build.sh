#!/usr/bin/env bash

set -ex

mkdir -p ./rootdir/userdata/roms/ports/{data/zero-k,.data/Zero-K}

if [ ! -e ./rootdir/userdata/roms/ports/data/zero-k/thumbnail.png ]; then
  wget    https://upload.wikimedia.org/wikipedia/commons/c/cc/Zeroklogo.png \
       -O ./rootdir/userdata/roms/ports/data/zero-k/thumbnail.png
fi

if [ ! -e ./rootdir/userdata/roms/ports/data/zero-k/video.webm ]; then
  youtube-dl https://www.youtube.com/watch?v=pHQkctGTm_A
  mv 'Zero-K Launch Trailer-pHQkctGTm_A.webm' ./rootdir/userdata/roms/ports/data/zero-k/video.webm
fi

unzip -uo zero-k-portable.zip -d ./rootdir/userdata/roms/ports/.data/Zero-K/

cd rootdir
batocera-makepkg
