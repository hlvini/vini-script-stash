#!/bin/bash

SRC="/home/user/" # Altere user para o nome do usuário na máquina
DEST="/mnt/backcup/$(date +%Y-%m-%d)"

mkdir -p "$DEST"

rsync -av --delete "$SRC" "$DEST"

echo "BACKUP SUCCESS $(date)" >> /var/log/backup.log 
