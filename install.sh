#!/bin/bash

echo
echo "Make sure you have a backup of your config files.
This will overwrite similar files. This script needs
sudo permissions."
echo
echo "fcitx, fcitx-mozc, and their required dependencies
will not be installed, but you will be prompted to istall
rofi, picom, nautilus, nautilus-open-any-terminal, and mpv..."
echo
read -p "Continue? " -n  1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

	if ! command -v yay 2>&1 >/dev/null
	then
		echo "Please install the yay AUR helper"
		exit 1
	fi

	yay -S nautilus-open-any-terminal
	sudo pacman -S picom rofi nautilus mpv
	sudo cp -r -f .config ~/
	sudo cp -r -f .themes ~/
	sleep 1
	echo
	sudo mv -f ~/.config/rofi/rofiblurblack.rasi /usr/share/rofi/themes/
	sudo mv -f ~/.themes/Os-Catalina-Night /usr/share/icons
	gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal xfce4-terminal
	echo
	echo "If you want to use my mozc keybindings,
you will need to manually import the "keymap.txt"
file in the mozc .config folder."
	echo
	echo "To open rofi, it is super+r.
To open xterm, it is super+e"
	echo

fi