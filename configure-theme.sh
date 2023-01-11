#!/bin/bash
pacman -S zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k ttf-meslo-nerd-font-powerlevel10k ttf-hack-nerd lsd c-lolcat --noconfirm
pacman -S gnome-browser-connector --noconfirm
pacman -S catppuccin-gtk-theme-mocha catppuccin-wallpapers-git catppuccin-mocha-grub-theme-git tela-icon-theme-git --noconfirm

chsh -s /usr/bin/zsh $USER
cp .zshrc ~/
cp .p10k.zsh ~/
cp .gitconfig ~/
cp -rl .config ~/
cp -r icons/ ~/.local/share/
mkdir ~/.zsh/
cp zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
mkdir -p ~/.local/share/themes/ && cp -r Catppuccin-Mocha-Standard-Lavender-Dark/ ~/.local/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark/
cp -r Catppuccin-Mocha-Standard-Lavender-Dark/gtk-4.0/ ~/.config/
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
dconf write /org/gnome/desktop/interface/monospace-font-name "'Hack Nerd Font Mono 12'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-Standard-Lavender-Dark'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Catppuccin-Mocha-Standard-Lavender-Dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Tela-dracula-dark'"