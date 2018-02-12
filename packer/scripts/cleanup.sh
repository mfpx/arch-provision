#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# Clean the pacman cache
/usr/bin/yes | /usr/bin/pacman -Scc
/usr/bin/pacman-optimize

