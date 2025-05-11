#!/usr/bin/env zsh

killall conky
sleep 2s

# Descobrir o diretório do próprio script, para rodar dali
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

conky -c ./Celaeno.conf &> /dev/null &
conky -c ./Grumium2.conf &> /dev/null &

exit
