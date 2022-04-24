#!/usr/bin/env bash

BASEDIR="./rootdir/userdata/roms/ports/"
GAMENAME="Veloren"

set -ex

rm -fr "${BASEDIR}"/.data/"${GAMENAME}"

mkdir -p "${BASEDIR}"/{,.}data/"${GAMENAME}" ./rootdir/userdata/system/pacman/batoexec/

if [ ! -e "${BASEDIR}"/data/"${GAMENAME}"/thumbnail.png ]; then
  wget    "https://user-content.gitlab-static.net/a3e00076279b6f541828b7a4735776d97a04038c/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3534313330373730383134363538313531392f3731323239353630353137303630323037352f6c6f676f2e706e67" \
       -O "${BASEDIR}"/data/"${GAMENAME}"/thumbnail.png
fi

if [ ! -e "${BASEDIR}/data/${GAMENAME}/video.webm" ]; then
  wget    https://veloren.net/videos/veloren.webm \
       -O "${BASEDIR}/data/${GAMENAME}/video.webm"
fi

if [ ! -e "${BASEDIR}/data/${GAMENAME}/screenshot.png" ]; then
  wget    https://book.veloren.net/contributors/guides/adding-armor/image1.png \
       -O "${BASEDIR}/data/${GAMENAME}/screenshot.png"
fi

if [ ! -e airshipper-linux.tar.gz ]; then
  wget https://github.com/veloren/airshipper/releases/latest/download/airshipper-linux.tar.gz
fi

gunzip airshipper-linux.tar.gz
tar xf airshipper-linux.tar
mv airshipper-linux/airshipper "${BASEDIR}"/.data/"${GAMENAME}"/

rm airshipper-linux.tar

chmod +x "Veloren.sh" "${BASEDIR}"/.data/"${GAMENAME}"/airshipper
cp Veloren.sh ./rootdir/userdata/roms/ports/
cp INSTALL    ./rootdir/userdata/system/pacman/batoexec/"${GAMENAME}"-settings

cd rootdir
batocera-makepkg
