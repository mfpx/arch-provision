#!/usr/bin/env bash

# Bash "strict" mode
set -euo pipefail
IFS=$'\n\t'

date | sudo tee /etc/vagrant_box_build_time

