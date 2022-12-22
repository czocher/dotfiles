#!/usr/bin/env bash

RESULT=$(notify-send --icon=backup --urgency=critical --action=BACKUP=Backup --action=CANCEL=Cancel 'Perform backup' 'Do you wish to perform a backup?')

if [ "$RESULT" == "CANCEL" ]; then
  exit 0
fi

restic backup --files-from ~/.backup_list

notify-send --icon=backup --urgency=low 'Backup complete'
