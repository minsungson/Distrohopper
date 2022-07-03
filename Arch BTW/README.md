# Automate Setting up Arch
## Installation
Clone the repo and run the bash script.
```
git clone https://github.com/minsungson/Arch-BTW.git && sudo chmod +x setup.sh && sudo bash ./setup.sh
```
## Prerequisites

It is assumed that script is being run on a fresh install of Arch - using archinstall - that the machine is connected to the internet.

## Sanity Check
```
iwctl
station wlan0 connect <NETWORK-NAME>
exit
ping 1.1.1.1
pacman -Sy archinstall
reboot now
```
After reboot
```
nmtui
ping 1.1.1.1
```
## DE

This bash script installs a minimal Gnome DE with a few default Gnome apps, including the Clock, Weather, Calendar apps. Wayland is installed for the display server protocol.

## Software Management

- Flatpak

## Compression Pacman Packages

- unrar
- p7zip

## Development Pacman Packages

- Curl
- Git
- Wget
- Vim
- Bash-completion

## AUR

AUR packages can be installed with yay. A GUI is also installed to manage AUR packages.

## Misc. Packaes

- Google Chrome

## Flatpack Packages

- VS Code
- Firefox
- Skype
- VLC
- Calibre
- Stremio
- Anki
