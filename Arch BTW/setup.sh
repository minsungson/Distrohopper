#!/bin/bash

# Install intel-ucode for Intel CPU
pacman -S --noconfirm intel-ucode --overwrite=/boot/intel-ucode.img

# Desktop Environment -Wayland
pacman -S --noconfirm xorg xorg-server

# Graphics Driver
pacman -S --noconfirm xf86-video-intel

# Install Gnome
pacman -S --noconfirm gdm gnome-shell gnome-terminal seahorse gnome-control-center xdg-user-dirs-gtk gnome-system-monitor gnome-terminal nautilus gvfs-mtp evince file-roller networkmanager gnome-software gnome-menus gnome-settings-daemon gnome-calendar gnome-logs gnome-weather gnome-tweaks gnome-shell-extensions gnome-backgrounds sushi

# Start Gnome by default
systemctl enable gdm
systemctl enable NetworkManager

# Setup AUR -yay
cd /opt
git clone https://aur.archlinux.org/yay-git.git
chown -R minsungson:minsungson ./yay-git
cd yay-git
makepkg -si


# Dev. Pacman Packages
pacman -S --noconfirm bash-completion wget git curl

# Compression Pacman Packages
pacman -S --noconfirm unrar p7zip

# Misc. Packages
pacman -S --noconfirm tlp firefox geary
yay -S --noconfirm google-chrome

# Flatpak install && Packages
pacman -S --noconfirm flatpak

flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.skype.Client -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.calibre_ebook.calibre -y
flatpak install flathub com.stremio.Stremio -y
flatpak install flathub net.ankiweb.Anki -y

# Install Fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Regular.ttf' /usr/share/fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Medium.ttf' /usr/share/fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Medium Italic.ttf' /usr/share/fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Italic.ttf' /usr/share/fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Bold.ttf' /usr/share/fonts
cp -r /home/minsungson/Arch-BTW/'Google Sans Text Bold Italic.ttf' /usr/share/fonts

# Change to global dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

fc-cache -f -v

pacman -Syu && pacman -Qdt # Upgrade all packages and remove orphaned files
reboot now