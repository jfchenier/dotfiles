#!/bin/bash
cd PaperWM
./install.sh
cd -
dconf load /org/gnome/shell/extensions/ < extensions-conf.txt
