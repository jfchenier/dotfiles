#!/bin/bash
pacman -Syy
pacman -S xorg networkmanager --noconfirm
pacman -S gnome gnome-tweaks --noconfirm
pacman -Syu gnome-shell-extension-appindicator --noconfirm
systemctl enable gdm.service
systemctl enable NetworkManager.service
# pacman -S refind --noconfirm

# refind-install
pacman -S snapper snap-pac --noconfirm
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
echo \
"[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
pacman -Syy
pacman -S grub-btrfs inotify-tools --noconfirm
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S btrfs-assistant --noconfirm
snapper -c root create-config /
systemctl enable grub-btrfsd

pacman -S zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k ttf-meslo-nerd-font-powerlevel10k lsd --noconfirm
cp .zshrc ~/
cp .gitconfig ~/
chsh -s /usr/bin/zsh $USER

pacman -S gnome-browser-connector --noconfirm

pacman -S catppuccin-gtk-theme-mocha catppuccin-wallpapers-git catppuccin-mocha-grub-theme-git tela-icon-theme-git --noconfirm
cp zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
dconf write /org/gnome/desktop/interface/monospace-font-name "'MesloLGS NF 10'"

mkdir -p ~/.local/share/themes/ && cp -r Catppuccin-Mocha-Standard-Lavender-Dark/ ~/.local/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark/
cp -r Catppuccin-Mocha-Standard-Lavender-Dark/gtk-4.0/ ~/.config/
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-Standard-Lavender-Dark'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Catppuccin-Mocha-Standard-Lavender-Dark'"



pacman -S pamac-aur --noconfirm
reboot now
