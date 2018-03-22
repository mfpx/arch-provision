#!/usr/bin/env bash
# NOTE: This script should NOT be run with SUDO as not all of the commands shoudl be
# run as root.  As a result this script calls sudo when needed, meaning you may be prompted
# for your password at that time.

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

sudo pacman -S --noconfirm linux-tools-meta

yaourt -S --noconfirm hypervfcopyd hypervkvpd hypervvssd

sudo systemctl enable hypervfcopyd.service hypervkvpd.service hypervvssd.service
