#!/usr/bin/env bash

# Bash "strict" mode
set -eu
IFS=$'\n\t'

# Clean the pacman cache
/usr/bin/yes | /usr/bin/pacman -Sc
