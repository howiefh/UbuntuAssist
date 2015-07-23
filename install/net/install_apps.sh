#!/bin/bash
baseapps=(nautilus-open-terminal unrar p7zip p7zip-rar p7zip-full vlc virtualbox conky smplayer vim-gnome exuberant-ctags goldendict chromium-browser guake gimp wine workrave ubuntu-restricted-extras pepperflashplugin-nonfree tmux zsh autojump)
for app in ${baseapps[@]}
do
	echo "Install $app"
	if [ "$1" == "y" ]; then
		apt-get -y install $app
	else
		apt-get install $app
	fi
done

codeapps=(g++ git-core git-gui git-doc apache2 mysql-server mysql-client php5 php5-gd php5-mysql phpmyadmin vsftpd)
for app in ${codeapps[@]}
do
	echo "Install $app"
	if [ "$1" == "y" ]; then
		apt-get -y install $app
	else
		apt-get install $app
	fi
done

ppas=(ppa:synapse-core/ppa)
for ppa in ${ppas[@]}
do
	echo "add ppa $ppa"
	add-apt-repository $ppa
done
apt-get update
ppa_apps1=()
for app1 in ${ppa_apps1[@]}
do
	echo "Install $app1"
	if [ "$1" == "y" ]; then
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

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
