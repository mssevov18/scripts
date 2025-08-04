#!/bin/bash

mapfile -t lines < <(hyprctl devices | grep "active")

active_keymap="EN"

for line in "${lines[@]}"; do
    if [[ "$line" == *"Bulgarian"* ]]; then
        active_keymap="BG"
        break
    fi
done

echo "$active_keymap"
