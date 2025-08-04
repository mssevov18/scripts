#!/bin/bash

if pgrep -x wvkbd-mobintl >/dev/null; then
	pkill wvkbd-mobintl
else
	~/scripts/wvkbd-big.sh &
fi
