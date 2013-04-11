#!/bin/bash
# 14:12:25 up 2 min, 2 users, load average: 0.46, 0.83, 0.72
# 22:05:02 up  3:21,  2 users,  load average: 1.16, 0.89, 0.74
# os_uptime=`uptime`
os_uptime='22:05:02 up 2 min,  2 users,  load average: 1.16, 0.89, 0.74'
os_time=`echo $os_uptime | sed 's/^.*up \{0,1\}//;s/[a-z]\{0,3\},.*$//'`
if [ $(echo $os_time | grep ':') ] ; then
	hour=`echo $os_time | cut -d ':' -f 1`
	min=`echo $os_time | cut -d ':' -f 2`
	os_time=$(($hour*60+$min))
fi
echo $os_time
if [ $os_time -lt 30 ] ; then
	echo exit1
	exit
fi
