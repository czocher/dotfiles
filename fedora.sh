#!/bin/bash

dnf install yubikey-personalization-gui gimp libreoffice git yakuake rust vim vim-X11

bash -c 'su -c "curl http://folkswithhats.org/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"'
