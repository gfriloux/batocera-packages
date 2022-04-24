DIR="$(dirname "$(readlink -f "$0")")"

unset LANG
unset LC_ALL

cd ${DIR}/.data/'Veloren'

export HOME="/userdata/saves/ports/Veloren"

mkdir -p "${HOME}"

unclutter-remote -s
./airshipper
unclutter-remote -h
