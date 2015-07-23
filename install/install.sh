#!/bin/bash
# Program:
# History:
# 2012 07/29 ���
chmod +x ./net/install_apps.sh
chmod +x ./local/*.sh
# ��װ���
sudo ./net/install_apps.sh y

# ������������ʾ�豸ͼ��
#./local/show_hide_devices_on_launcher.sh

# gedit����
echo "set gedit"
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','GB18030','GB2312','GBK','BIG5','CURRENT','UTF-16']"

# ���ֲ���������
echo "edit profile"
./local/edit_profile.sh

# nautilus-scripts
echo "edit nautilus-scripts"
# �����ʷ��¼
cp "./local/files/clear history" "/home/fenghao/.local/share/nautilus/scripts/clear history"
# ��Ƶת��
cp "./local/files/avi & mp4 converter" "/home/fenghao/.local/share/nautilus/scripts/avi & mp4 converter"
# ������
cp ./local/files/rename /home/fenghao/.local/share/nautilus/scripts/rename
# �Թ���Ա������
cp "./local/files/browse as root" "/home/fenghao/.local/share/nautilus/scripts/browse as root"
# �Թ���Ա�����Ĭ�������
cp "./local/files/open with default soft as root" "/home/fenghao/.local/share/nautilus/scripts/open with default soft as root"
chmod +x /home/fenghao/.local/share/nautilus/scripts/*

# Ubuntu 12.04����
echo "enable hibernate"
sudo cp ./local/files/com.ubuntu.enable-hibernate.pkla /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla

# �༭desktop�ļ�
echo "edit desktop files"
./local/desktop.sh

# �Զ�����windows����
#./local/automount_win_disk.sh

# �༭bashrc�����ն�
echo "edit bashrc"
./local/edit_bashrc.sh

# firefox �����ļ�����
echo "edit firefox ecode"
./local/firefox_encode.sh

# �༭grub
echo "edit grub.cfg"
./local/edit_grub.sh

# ��װjdk
# ./local/install_jdk.sh


