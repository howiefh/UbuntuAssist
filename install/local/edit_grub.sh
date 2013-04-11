#!/bin/bash
cp /boot/grub/grub.cfg ./back/grub.cfg
sudo sed -i "s/set timeout=10/set timeout=3/" /boot/grub/grub.cfg
