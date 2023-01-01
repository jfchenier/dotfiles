#!/bin/bash

chsh -s /usr/bin/zsh $USER
cp .zshrc ~/
cp .gitconfig ~/
mkdir ~/.zsh/
cp zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
mkdir -p ~/.local/share/themes/ && cp -r Catppuccin-Mocha-Standard-Lavender-Dark/ ~/.local/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark/
cp -r Catppuccin-Mocha-Standard-Lavender-Dark/gtk-4.0/ ~/.config/
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
dconf write /org/gnome/desktop/interface/monospace-font-name "'Hack Nerd Font Mono 12'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-Standard-Lavender-Dark'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Catppuccin-Mocha-Standard-Lavender-Dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Tela-dracula-dark'"