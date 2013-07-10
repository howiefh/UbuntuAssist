#!/bin/bash
apps=(nautilus-open-terminal vim-gnome ibus-googlepinyin chmsee unrar p7zip p7zip-rar p7zip-full vlc virtualbox conky gdebi smplayer osdlyrics xdotool gstreamer0.10-plugins-ugly zenity xsel flashplugin-installer exuberant-ctags cheese g++ calibre mencoder ffmpeg goldendict chromium-browser guake dia)
for app in ${apps[@]}
do
	echo "Install $app"
	if [ $1 == "y" ]; then
		apt-get -y install $app
	else
		apt-get install $app
	fi
done

ppas=(ppa:drwright/stable ppa:ricotz/docky ppa:stebbins/handbrake-releases ppa:marlin-devs/marlin-daily ppa:synapse-core/ppa ppa:tiheum/equinox ppa:upubuntu-com/gtk3 ppa:noobslab/themes)
for ppa in ${ppas[@]}
do
	echo "add ppa $ppa"
	add-apt-repository $ppa
done
apt-get update
apps1=(drwright plank handbrake-gtk marlin synapse faenza-icon-theme malys-rough-theme elementary-theme)
for app1 in ${apps1[@]}
do
	echo "Install $app1"
	if [ $1 == "y" ]; then
		apt-get -y install $app1
	else
		apt-get install $app1
	fi
done
# apt-get install nautilus-open-terminal
# apt-get install vim-gnome
# apt-get install ibus-googlepinyin
# apt-get install chmsee
# apt-get install unrar p7zip p7zip-rar p7zip-full
# apt-get install vlc
# apt-get install virtualbox
# apt-get install conky
# apt-get install gdebi
# apt-get install smplayer
# apt-get install osdlyrics
# apt-get install xdotool
# apt-get install gstreamer0.10-plugins-ugly

