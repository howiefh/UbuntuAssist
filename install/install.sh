#!/bin/bash
# Program:
# History:
# 2012 07/29 冯浩
chmod +x ./net/install_apps.sh
chmod +x ./local/*.sh
# 安装软件
sudo ./net/install_apps.sh y

# 在启动器上显示设备图标
#./local/show_hide_devices_on_launcher.sh

# gedit乱码
echo "set gedit"
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','GB18030','GB2312','GBK','BIG5','CURRENT','UTF-16']"

# 音乐播放器乱码
echo "edit profile"
./local/edit_profile.sh

# nautilus-scripts
echo "edit nautilus-scripts"
# 清空历史记录
cp "./local/files/clear history" "/home/fenghao/.local/share/nautilus/scripts/clear history"
# 视频转换
cp "./local/files/avi & mp4 converter" "/home/fenghao/.local/share/nautilus/scripts/avi & mp4 converter"
# 重命名
cp ./local/files/rename /home/fenghao/.local/share/nautilus/scripts/rename
# 以管理员身份浏览
cp "./local/files/browse as root" "/home/fenghao/.local/share/nautilus/scripts/browse as root"
# 以管理员身份用默认软件打开
cp "./local/files/open with default soft as root" "/home/fenghao/.local/share/nautilus/scripts/open with default soft as root"
chmod +x /home/fenghao/.local/share/nautilus/scripts/*

# Ubuntu 12.04休眠
echo "enable hibernate"
sudo cp ./local/files/com.ubuntu.enable-hibernate.pkla /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla

# 编辑desktop文件
echo "edit desktop files"
./local/desktop.sh

# 自动挂在windows分区
#./local/automount_win_disk.sh

# 编辑bashrc美化终端
echo "edit bashrc"
./local/edit_bashrc.sh

# firefox 下载文件乱码
echo "edit firefox ecode"
./local/firefox_encode.sh

# 编辑grub
echo "edit grub.cfg"
./local/edit_grub.sh

# 安装jdk
# ./local/install_jdk.sh


