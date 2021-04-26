DIR="$(dirname "$(readlink -f "$0")")"

cd "${DIR}/.data/Zero-K"

unclutter-remote -s
./Zero-K_linux64.sh
unclutter-remote -h
