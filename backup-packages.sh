#!/bin/bash

TEMP=$(mktemp -d)
ZIP=backup-$(date +%F).zip

apt-mark showmanual > "$TEMP/manual-packages.txt"
flatpak list --app --columns=application > "$TEMP/flatpaks-list.txt"
snap list > "$TEMP/snaps-list.txt"

zip -r "$ZIP" "$TEMP"

rm -rf "$TEMP"
