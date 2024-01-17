#!/bin/bash
pacman -Syy

pacman -S gnome gnome-tweaks gnome-shell-extension-appindicator --noconfirm
pacman -S snapper snap-pac --noconfirm

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
echo \
"[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
pacman -Syy

pacman -S --needed --noconfirm - < base-packages
systemctl enable gdm.service
systemctl enable NetworkManager.service

pacman -S grub-btrfs inotify-tools --noconfirm
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S btrfs-assistant --noconfirm
snapper -c root create-config /
systemctl enable grub-btrfsd

pacman -S pamac-aur --noconfirm

reboot now
