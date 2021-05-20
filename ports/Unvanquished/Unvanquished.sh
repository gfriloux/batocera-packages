DIR="$(dirname "$(readlink -f "$0")")"

cd ${DIR}/.data/'Unvanquished'

export HOME="/userdata/saves/ports/Unvanquished"

mkdir -p "${HOME}"

unclutter-remote -s
./updater
unclutter-remote -h
