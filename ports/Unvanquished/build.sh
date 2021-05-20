#!/usr/bin/env bash

set -ex

mkdir -p ./rootdir/userdata/roms/ports/{data/unvanquished,.data}          \
         ./rootdir/userdata/saves/ports/Unvanquished/.config/unvanquished \
         ./rootdir/userdata/system/pacman/batoexec/

if [ ! -e ./rootdir/userdata/roms/ports/data/unvanquished/thumbnail.png ]; then
  wget    https://img.linuxfr.org/img/68747470733a2f2f646c2e696c6c776965636b7a2e6e65742f622f6c696e757866722e6f72672f756e76616e717569736865642f7a6f6e652d35312f66616365626f6f6b2d636f7665722e706e67/facebook-cover.png \
       -O ./rootdir/userdata/roms/ports/data/unvanquished/thumbnail.png
fi

if [ ! -e ./rootdir/userdata/roms/ports/data/unvanquished/screenshot.png ]; then
  wget    https://unvanquished.net/wp-content/uploads/2015/01/parpax_aliens.png \
       -O ./rootdir/userdata/roms/ports/data/unvanquished/screenshot.png
fi

if [ ! -e ./rootdir/userdata/roms/ports/.data/Unvanquished ]; then
  unzip Unvanquished.zip -d ./rootdir/userdata/roms/ports/.data/
fi

chmod +x Unvanquished.sh ./rootdir/userdata/roms/ports/.data/Unvanquished/{updater,daemon{,ded,-tty},crash_server,irt_core-x86_64.nexe,nacl_helper_bootstrap,nacl_loader}

cp updater.conf    ./rootdir/userdata/saves/ports/Unvanquished/.config/unvanquished/
cp Unvanquished.sh ./rootdir/userdata/roms/ports/
cp INSTALL         ./rootdir/userdata/system/pacman/batoexec/unvanquished-settings

cd rootdir
batocera-makepkg
