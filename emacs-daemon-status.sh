#!/bin/bash
set -e

echo "Emacs TTY:"
systemctl --user is-active emacs-tty.service || echo "  (not active)"

echo "Emacs GUI:"
systemctl --user is-active emacs-gui.service || echo "  (not active)"

echo
ls -l /run/user/$(id -u)/emacs/ || echo "No daemon sockets found."

