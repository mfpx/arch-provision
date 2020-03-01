#!/usr/bin/env bash

# Write zeros to improve virtual disk compaction
zerofile=$(/usr/bin/mktemp /zerofile.XXXXX)
/usr/bin/dd if=/dev/zero of="$zerofile" bs=1M 2> /dev/null
/usr/bin/rm -f "$zerofile"
/usr/bin/sync
