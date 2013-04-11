#!/bin/bash
current_status=`gconftool --get /apps/compiz-1/plugins/unityshell/screen0/options/devices_option`
echo "Current Status:" $current_status
if [ $current_status == 1 ];then
	echo "Hide devices on launcher"
	gconftool --set /apps/compiz-1/plugins/unityshell/screen0/options/devices_option --type=int 0
else
	echo "Show devices on launcher"
	gconftool --set /apps/compiz-1/plugins/unityshell/screen0/options/devices_option --type=int 1
fi

