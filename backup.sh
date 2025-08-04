#!/usr/bin/env sh

rsync -aAXv --delete --partial --inplace --progress --stats \
	-e 'ssh -p 2222' \
	--exclude="*" \
	--include="pkglist.txt" \
	--include="desktop/***" \
	--include="music/***" \
	--include="documents/***" \
	--include="dotfiles/***" \
	--include="downloads/***" \
	--include="torrents/***" \
	--include="org/***" \
	--include="uni/***" \
	--include="packages/***" \
	--include="games/***" \
	--include="Games/***" \
	--include="pictures/***" \
	--include="videos/***" \
	--include="inbox/***" \
	--include="services/***" \
	--include=".config/***" \
	--include=".bashrc" \
	--include="backup.sh" \
	--include="scripts/***" \
	--include="qc" \
	--include="models/***" \
	--include="upback.sh" \
	/home/octo/ \
	octo@192.168.191.19:/home/octo/disk/backups/arch-octo-03-May/home-octo/
