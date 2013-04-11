#!/bin/bash
echo "/etc/fstab"
exist_WinC=`grep '^#WinC分区' /etc/fstab`
if [ $exist_WinC ] ; then
	echo "No change"
else 
	sudo sh -c "cat ./files/win_disk >> /etc/fstab"
fi

