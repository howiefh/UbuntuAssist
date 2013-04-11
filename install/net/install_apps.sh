#!/bin/bash
apps=(nautilus-open-terminal vim-gnome ibus-googlepinyin chmsee unrar p7zip p7zip-rar p7zip-full vlc virtualbox conky gdebi smplayer osdlyrics xdotool gstreamer0.10-plugins-ugly zenity xsel flashplugin-installer exuberant-ctags cheese g++ calibre mencoder ffmpeg chromium-browser)
for app in ${apps[@]}
do
	echo "Install $app"
	if [ $1 == "y" ]; then
		apt-get -y install $app
	else
		apt-get install $app
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

