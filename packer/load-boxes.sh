#!/usr/bin/env bash

# Bash "strict" mode
SOURCED=false && [ "$0" = "$BASH_SOURCE" ] || SOURCED=true
if ! $SOURCED; then
  set -eEuo pipefail
  shopt -s extdebug
  trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
  IFS=$'\n\t'
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for box in $SCRIPT_DIR/boxes/*.box; do
  boxFile=${box##*/}
  boxName="${boxFile%.*}"

  if [[ $(vagrant box list | grep -i "$boxName") ]]; then
    echo -e "\e[93mRemoving old box - ${boxName}\e[0m"
    vagrant box remove "$boxName"
  fi

  echo -e "\e[93mAdding box - ${boxName}\e[0m"
  vagrant box add "${box}" --name "${boxName}"
done
