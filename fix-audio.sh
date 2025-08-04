#!/bin/bash
sleep 6

# List available nodes (debug)
echo "Before fix:" >>/tmp/audio-fix.log
wpctl status >>/tmp/audio-fix.log

# Restart everything audio-related
systemctl --user restart pipewire wireplumber pipewire-pulse

# Wait and try setting output manually
sleep 3

# Get the node ID of your internal speakers
SPEAKER_ID=$(wpctl status | grep -i "ALC245 Analog" | grep -oE '^[[:space:]]*[0-9]+' | awk '{print $1}')

# If found, set it as default and unmute
if [ -n "$SPEAKER_ID" ]; then
	wpctl set-default "$SPEAKER_ID"
	wpctl set-volume "$SPEAKER_ID" 1.0
else
	echo "SPEAKER_ID not found" >>/tmp/audio-fix.log
fi

# Re-log
echo "After fix:" >>/tmp/audio-fix.log
wpctl status >>/tmp/audio-fix.log
