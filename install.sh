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
	cp -r -f .config ~/
	cp -r -f .themes ~/
	sleep 1
	echo
	sudo mv -f ~/.config/rofi/rofiblurblack.rasi /usr/share/rofi/themes/
	sudo mv -f ~/.themes/Os-Catalina-Night /usr/share/icons
	sudo mv -f ~/.themes/MacOS-Pixel-vr4-Linux/MacOS-Pixel-vr4 /usr/share/icons

	echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=picom
Comment=
Exec=/home/$(whoami)/.config/picom/picomstart.sh
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" > /home/$(whoami)/.config/autostart/picomtest.desktop

	echo "sleep 3 && picom -b --config /home/$(whoami)/.config/picom/picom.conf" > /home/$(whoami)/.config/picom/picomstarttest.sh

	chmod +x /home/$(whoami)/.config/autostart/picomtest.desktop
	chmod +x /home/$(whoami)/.config/picom/picomstarttest.sh

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
