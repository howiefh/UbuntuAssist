#!/bin/bash
#http://blog.csdn.net/jaymade/article/details/7569012
INIFILE=$1
SECTION=$2
ITEM=$3
NEWVAL=$4

function ReadINIfile()
{
	# -F定义字段分隔字符，~/'$ITEM' ~ 匹配 !~不配 /用于定界
	ReadINI=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $INIFILE`
	echo $ReadINI
}
function WriteINIfile()
{
	WriteINI=`sed -i "/^\[$SECTION\]/,/^\[/{/^\[$SECTION\]/b;/^\[/b;s/^$ITEM*=.*/$ITEM=$NEWVAL/g;}" $INIFILE`
	echo $WriteINI
}

# $1 : config file $2 : section $3 : key $4 : value
if [ "$4" == "" ] ; then
	ReadINIfile $1 $2 $3
else
	WriteINIfile $1 $2 $3 $4
fi
