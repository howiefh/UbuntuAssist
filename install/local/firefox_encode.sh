#!/bin/bash
env_exist=`grep -i "^env" /etc/environment`
echo $env_exist
if [[ $env_exist ]] ; then
	echo "No change"
else
	sudo bash -c "echo -e '\nenv LANG=zh_CN.GBK firefox' >> /etc/environment"
fi
