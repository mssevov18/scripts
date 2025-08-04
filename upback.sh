#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "Usage: $0 <relative-path-from-home>"
	exit 1
fi

rsync -aAXv -e 'ssh -p 2222' \
	"octo@192.168.191.19:/home/octo/disk/backups/arch-octo-03-May/home-octo/$1" ~/"$1"
