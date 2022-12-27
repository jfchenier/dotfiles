#/bin/bash
pacman -Syy
pacman -S xorg networkmanager --noconfirm
pacman -S gnome --noconfirm
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
pacman -S btrfs-assistant --noconfirm
snapper -c root create-config /
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable grub-btrfsd

pacman -S zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k lsd --noconfirm
mv .zshrc ~/
chsh -s /usr/bin/zsh


pacman -S pamac-aur --noconfirm
reboot now
