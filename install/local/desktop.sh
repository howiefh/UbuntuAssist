#!/bin/bash
cd ./local
applications="/usr/share/applications/"
apps=(gvim vlc smplayer)
#echo $apps
#echo ${apps[@]}
for app in ${apps[@]}
do
	echo "Edit $app.desktop"
	if [ -e $applications$app".desktop" ] ; then
		actions=`grep -i "^Actions=" $applications$app.desktop`
		if [ $actions ]; then
			echo "No change"
		else
			cp $applications$app".desktop" ./back/$app".desktop.back"
			# sudo cat ./desktop/gvim >> $applications"gvim.desktop" 这是不行的
			# cat ./desktop/gvim | sudo tee -a $applications"gvim.desktop"
			sudo sh -c "cat ./desktop/$app >> $applications$app".desktop""
		fi
	else
		echo "Not exist "$app".decktop"
	fi
done

apps_2=(firefox)
for app in ${apps_2[@]}
do
	echo "Edit $app.desktop"
	if [ -e $applications$app".desktop" ] ; then
		cp $applications$app".desktop" ./back/$app".desktop.back"
	else
		echo "Not exist "$app".decktop"
	fi
	sudo cp ./desktop/$app".desktop" $applications$app".desktop"
done

apps_1=(XnView eclipse showdesktop foxit)
user_applications=$HOME"/.local/share/applications"
for app in ${apps_1[@]}
do
	cp ./desktop/$app.desktop $user_applications
done

cd ..
