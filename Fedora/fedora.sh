#!/bin/bash

# Install Developer Packages
sudo dnf install bleachbit -y
sudo dnf install libreoffice -y
sudo dnf install gparted -y
sudo dnf install git -y
sudo dnf install curl -y
sudo dnf install wget -y
sudo dnf install preload -y
sudo dnf update && sudo dnf upgrade -y

# Install VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

# Install Flatpak && Flatpak Packages
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.skype.Client -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.calibre_ebook.calibre -y
flatpak install flathub com.bitwarden.desktop -y
flatpak install flathub com.stremio.Stremio -y
flatpak install flathub net.ankiweb.Anki -y
flatpak install flathub sh.cider.Cider

# Install/remove default Gnome packages
sudo dnf install gnome-tweaks -y
sudo dnf install gnome-shell-extensions -y
sudo dnf remove connections -y
sudo dnf remove gnome-calculator -y
sudo dnf remove gnome-tour -y
sudo dnf remove gnome-maps -y
sudo dnf remove rhythmbox -y
sudo dnf remove gnome-contacts -y
sudo dnf remove gnome-characters -y

# Install Howdy
sudo dnf copr enable principis/howdy -y
sudo dnf --refresh install howdy -y

# Configure TLP
sudo dnf install tlp tlp-rdw
sudo dnf remove power-profiles-daemon
sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

gsettings set org.gnome.desktop.privacy report-technical-problems false
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.19852941176470584
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.datetime automatic-timezone true
gsettings set org.gnome.software show-ratings true
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding start-corner 'top-right'
gsettings set org.gnome.desktop.interface font-name 'Google Sans Text 10'
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark


sudo dnf copr enable uriesk/i8kutils -y
sudo dnf isntall i8ktils -y