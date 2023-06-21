#!/usr/bin/env bash

RESULT=$(notify-send --app-name=Backup --icon=backup --expire-time=20000 --action=BACKUP=Backup --action=CANCEL=Cancel 'Perform backup' 'Do you wish to perform a backup?')

if [ "$RESULT" == "CANCEL" ] || [ -z $RESULT ]; then
  exit 0
fi

RESULT=$(restic backup --files-from ~/.backup_list -exclude-file ~/.backup_exclude_list)

notify-send --app-name=Backup --icon=backup --urgency=low 'Backup complete' "$RESULT"
