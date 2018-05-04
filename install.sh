#!/bin/bash

if [[ $(id -u) -eq 0 ]] ; then echo "Please run as non-root" ; exit 1 ; fi

# Kill the whole script on CTRL+C
trap "exit" INT

if [[ -f /etc/fedora-release ]]; then
  bash fedora.sh
fi

bash generic.sh
