#!/bin/bash
####
# This script is used to copy my config files over for use on reboot of installation.

cd
cd whonix-i3

#7z x candy-icons.7z -ocandy-icons
sudo cp -r candy-icons /usr/share/icons/


# import scripts
cp -r scripts/ ~/

# import backgrounds
cp -r config/backgrounds/ ~/.config

# import window manager and bar configs
cp -r config/i3/ ~/.config
cp -r config/i3blocks/ ~/.config

# import notification daemon config
cp -r config/dunst/ ~/.config

# import app launcher config (optional - ensures dark theme works out of the box)
cp -r config/rofi/ ~/.config

# import terminal configs (optional - ensures dark theme and transparancy work out of the box)
cp -r config/terminator/ ~/.config
cp -r config/konsole/ ~/.local/share
cp config/konsolerc ~/.config

# import dashboard configs (optional - ensures dashboard works)
cp -r config/neofetch/ ~/.config

# Import themes and themed configs
cp -r config/xfce4 ~/.config
cp -r config/gtk-3.0 ~/.config
cp -r config/gtk-4.0 ~/.config
cp config/QtProject.conf ~/.config
sudo cp -r config/Sweet-Dark-v40 /usr/share/themes
cp -r config/copyq ~/.config
cp -r config/galculator ~/.config

# make scripts executable
chmod +x ~/.config/i3blocks/cpu/cpu_info.sh
chmod +x ~/.config/i3blocks/battery/battery_info.sh
sudo chmod +x ~/scripts/*.sh

# Check if VLC is installed
if command -v vlc >/dev/null 2>&1; then
    echo "VLC is installed. Setting it as the default media player."

    # Define the VLC desktop entry file name
    VLC_DESKTOP="vlc.desktop"

    # Set default applications for various video MIME types
    xdg-mime default "$VLC_DESKTOP" video/mp4
    xdg-mime default "$VLC_DESKTOP" video/x-matroska
    xdg-mime default "$VLC_DESKTOP" video/x-msvideo
    xdg-mime default "$VLC_DESKTOP" video/x-flv
    xdg-mime default "$VLC_DESKTOP" video/webm

    # Set default applications for various audio MIME types
    xdg-mime default "$VLC_DESKTOP" audio/mpeg
    xdg-mime default "$VLC_DESKTOP" audio/x-wav
    xdg-mime default "$VLC_DESKTOP" audio/x-flac
    xdg-mime default "$VLC_DESKTOP" audio/ogg
    xdg-mime default "$VLC_DESKTOP" audio/mp4

    echo "Default media player set to VLC for common video and audio file types."
else
    echo "Error: VLC is not installed. Please install VLC first using 'sudo apt-get install vlc'."
fi
