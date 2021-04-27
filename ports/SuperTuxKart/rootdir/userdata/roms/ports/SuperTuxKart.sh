DIR="$(dirname "$(readlink -f "$0")")"

cd "${DIR}/.data/SuperTuxKart"

unclutter-remote -s
./run_game.sh
unclutter-remote -h
