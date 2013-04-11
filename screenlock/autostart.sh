#!/bin/bash
path="$HOME/.config/autostart/screenlock.desktop"
echo "[Desktop Entry]" > $path
echo "Type=Application" >> $path
echo "Exec=/home/fenghao/.apps/OSAssist/screenlock/screenlock" >> $path
echo "Type=Application" >> $path
echo "NoDisplay=false" >> $path
echo "X-GNOME-Autostart-enabled=true" >> $path
echo "Name=自动锁屏" >> $path
echo "Comment=隔一小时锁屏5分钟" >> $path
