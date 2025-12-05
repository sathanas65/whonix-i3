#!/bin/bash

# on error continue
set +e

# reset sudo clock every 60 seconds so you only have to enter password once
while true; do
    sudo -v
    sleep 60
done &

sudo apt-get update && sudo apt-get upgrade -y

# terminal text editor
# VIM is required for keymap to work out of the box
sudo apt-get install -y vim

# appearance managers
sudo apt-get install -y lxappearance picom 

# file managers
sudo apt-get install -y nemo
#sudo apt-get install -y thunar
#sudo apt-get install -y krusader
#sudo apt-get install -y nautilus

# terminal file search
sudo apt-get install -y fzf

# terminal list directory (on steroids)
sudo apt-get install -y exa

# terminal emulators
# terminator (dot files included)
sudo apt-get install -y terminator
# kitty (no dot files yet)
#sudo apt-get install -y kitty 
# konsole (required for out of box use of:
# Super + Shift + h for keymap and 
sudo apt-get install -y konsole

# tmux - terminal multiplexer - runs in terminal and shell sessions run in tmux - excellent features
sudo apt-get install -y tmux

# hardware info
sudo apt-get install -y procinfo hwinfo hdparm lm-sensors psensor

# terminal apps  
sudo apt-get install -y neofetch bpytop cmatrix
# these can be removed if you don't want them
sudo apt-get install -y htop glances figlet calc

# gui system monitor
sudo apt-get install -y gnome-system-monitor

# enable non-free repos
sudo apt-get install -y software-properties-common apt-transport-https curl ca-certificates -y
echo | sudo apt-add-repository contrib non-free-firmware
sudo apt-get update && sudo apt-get upgrade -y

# create ~/.local/share/applications/ to support executables and snaps in Rofi
mkdir ~/.local/share/applications/

# printer support
#sudo apt-get install -y cups
#sudo systemctl enable cups

# document viewer
sudo apt-get install -y evince
sudo apt-get install -y okular

# ebook reader
sudo apt-get install -y foliate

# comic reader
sudo apt-get install -y mcomix

# calculator
#sudo apt-get install -y gnome-calculator
#galculator is customized
sudo apt-get install -y galculator

# background / image manager
sudo apt-get install -y feh

# app launcher ($mod + Space)
sudo apt-get install -y rofi

# auto numlock
sudo apt-get install -y numlockx

# notification daemon
sudo apt-get install -y dunst libnotify-bin

# user dialog
sudo apt-get install -y yad

# gui text editor
# geany
sudo apt-get install -y geany

# office apps
sudo apt-get install -y libreoffice

# display settings
sudo apt-get install -y arandr

# media player
sudo apt-get install -y vlc 

# non free codecs (NOT FOSS)
#sudo apt-get install -y ttf-mscorefonts-installer libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly

# disk utilities
sudo apt-get install -y gnome-disk-utility gsmartcontrol gparted

# clipboard manager
sudo apt-get install -y copyq

# notes manager
#zim (easy checkbox lists and much more)
sudo apt-get install -y zim

# screenshots
sudo apt-get install -y maim xclip xdotool jq

# zip utilities
sudo apt-get install -y tar gzip p7zip-full

# gpg encryption manager
sudo apt-get install -y kleopatra

# password manager
# keepassxc - mobile version but no syncing - passwords only stored locally - supports local database file syncing so you can manually sync devices by export/import of database
sudo apt-get install -y keepassxc

# simplified man pages
sudo apt-get install -y tldr

# user directories (disable this if you want many things to not work. There will be weeping and gnashing of teeth)
#xdg-user-dirs-update

# bleachbit file shredder
sudo apt-get -y install bleachbit

# These are required for the theme and icons to work and i3bar to display correctly
sudo apt-get install -y libgtk-4-dev
sudo apt-get install -y fonts-noto-color-emoji 
git clone https://github.com/EliverLara/candy-icons

# kvm/qemu guest agent
sudo apt-get install -y spice-vdagent 

### graphical user interface

# window manager DO NOT REMOVE
sudo apt-get install -y i3 i3blocks acpi-support

# import scripts and configs
sh ~/whonix-i3/copyconf.sh

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get auto-remove -y

sudo reboot now
