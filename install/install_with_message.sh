#!/bin/bash
# Program:
# History:
# 2012 07/29 冯浩
sudo ./install_apps.sh
read -p "All applications have installed,go on?Please input (Y/N): " yn
if [ "$yn" == "Y" ] || [ "$yn" == "y" ]; then
	echo "OK, continue"
	./show_hide_devices_on_launcher.sh
elif [ "$yn" == "N" ] || [ "$yn" == "n" ]; then
	echo "Oh, interrupt!"
	exit 0
else
	echo "I don't know what your choice is"
	exit 0
fi

sudo ./net/install_apps.sh y

# 在启动器上显示设备图标
./local/show_hide_devices_on_launcher.sh

# gedit乱码
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','GB18030','GB2312','GBK','BIG5','CURRENT','UTF-16']"

# 音乐播放器乱码
./local/edit_profile.sh

# 清空历史记录
cp ./local/files/清空历史记录 /home/fenghao/.gnome2/nautilus-scripts/清空历史记录

# Ubuntu 12.04休眠
sudo cp ./local/files/com.ubuntu.enable-hibernate.pkla /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla

# 编辑desktop文件
./local/desktop.sh

# 自动挂在windows分区
./local/automount_win_disk.sh

# 编辑bashrc美化终端
./local/edit_bashrc.sh

# 安装jdk
# ./local/install_jdk.sh


