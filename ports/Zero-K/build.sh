#!/usr/bin/env bash

set -ex

mkdir -p ./rootdir/userdata/roms/ports/{data/zero-k,.data/Zero-K}

if [ ! -e ./rootdir/userdata/roms/ports/data/zero-k/thumbnail.jpg ]; then
  wget    https://cdn.cloudflare.steamstatic.com/steam/apps/334920/header.jpg \
       -O ./rootdir/userdata/roms/ports/data/zero-k/thumbnail.jpg
fi

if [ ! -e ./rootdir/userdata/roms/ports/data/zero-k/video.webm ]; then
  wget    https://cdn.cloudflare.steamstatic.com/steam/apps/256713588/movie480.webm \
       -O ./rootdir/userdata/roms/ports/data/zero-k/video.webm
fi

unzip -uo zero-k-portable.zip -d ./rootdir/userdata/roms/ports/.data/Zero-K/

cd rootdir
batocera-makepkg
