#!/bin/sh

function all() {
    for B in {0..255}; do
        tput setab $B
        for C in {0..255}; do
            tput setaf $C
            echo -n "$B : $C | "
        done
    done
    tput sgr0
    echo
}

function all_fg() {
    for C in {0..255}; do
        tput setaf $C
        echo -n "$C | "
    done
    tput sgr0
    echo
}

function all_bg() {
    for B in {0..255}; do
        tput setab $B
        echo -n "$B | "
    done
    tput sgr0
    echo
}

function setclr() {
    if [ -z "$1" ]; then
        echo "Give bg color"
    else
        if [ -z "$2" ]; then
            echo "Give fg color"
        else
            tput setab $1
            tput setaf $2
        fi
    fi
}

function clearclr() {
    tput sgr0
    echo
}

if [ -z "$1" ]; then
    echo "colors.sh <command> [options]"
    echo "commands:"
    echo "	all -> shows all color combinations (may take time)"
    echo "	all-fg -> shows all foreground colors"
    echo "	all-bg -> shows all background colors"
    echo "	set -> followed by [bgCol] [fgCol] and changes to them"
    echo "	reset/clear -> puts 'tput sgr0' and clears"
else 
    case $1 in
        "all")
            all
            ;;
        "all-fg")
            all_fg
            ;;
        "all-bg")
            all_bg
            ;;
        "set")
            setclr "$2" "$3"
            ;;
        "reset")
            clearclr
            ;;
        "clear")
            clearclr
            ;;
    esac
fi


