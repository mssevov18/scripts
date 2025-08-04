#!/bin/bash

monitor-sensor | while read -r line; do
	if [[ "$line" == *"Tilt changed:"* ]]; then
		if echo "$line" | grep -q "face-down"; then
			echo "[wvkbd] Tablet mode: ON — launching"
			pgrep wvkbd-mobintl >/dev/null || ~/scripts/wvkbd-big.sh &
		elif echo "$line" | grep -q "tilted-up\|vertical"; then
			echo "[wvkbd] Tablet mode: OFF — killing"
			pkill wvkbd-mobintl
		fi
	fi
done
