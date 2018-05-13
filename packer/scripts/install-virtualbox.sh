#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

# VirtualBox Guest Additions
# https://wiki.archlinux.org/index.php/VirtualBox
/usr/bin/pacman -Syu --noconfirm virtualbox-guest-dkms virtualbox-guest-utils
echo -e 'vboxguest\nvboxsf\nvboxvideo' >/etc/modules-load.d/virtualbox.conf

/usr/bin/systemctl enable vboxservice.service

# Add groups for VirtualBox folder sharing
/usr/bin/usermod --append --groups vagrant,vboxsf vagrant
