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

app="firefox"
echo "Edit $app.desktop"
if [ -e $applications$app".desktop" ] ; then
	cp $applications$app".desktop" ./back/$app".desktop.back"
	sudo cp ./desktop/$app".desktop" $applications$app".desktop"
else
	echo "Not exist "$app".decktop"
fi

apps_1=(XnView eclipse showdesktop)
user_applications=$HOME"/.local/share/applications"
for app in ${apps_1[@]}
do
	cp ./desktop/$app.desktop $user_applications
done

cd ..
