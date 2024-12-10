#!/bin/bash

echo
echo "Make sure you have a backup of your config files.
This will overwrite similar files. This script needs
sudo permissions."
echo
echo "You will be prompted to istall
rofi, picom, noto CJK fonts, and mpv..."
echo
read -p "Continue? y/n" -n  1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

	sudo pacman -S picom rofi mpv noto-fonts-cjk
	cp -r -f .config ~/
	sleep 1
	echo
	sudo mv -f ~/.config/rofi/rofiblurblack.rasi /usr/share/rofi/themes/
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
	echo "The theme, icon pack, and cursor I use are recommended to be used in tandem with my config files.
 You can find the link to these in the README."
	echo

fi
