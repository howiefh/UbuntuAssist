#!/bin/bash
text='\nexport PATH=$PATH GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030\nexport PATH=$PATH GST_ID3V2_TAG_ENCODING=GBK:UTF-8:GB18030'
echo "Edit $HOME/.profile"
exist_export_path=`grep -i '^export PATH=$PATH GST_ID3_TAG_ENCODING=GBK:UTF-8:GB18030' $HOME/.profile`
if [ "$exist_export_path" ] ; then
	echo "No change"
else 
	cp $HOME/.profile $HOME/.profile_back
	echo -e $text >> $HOME/.profile
fi
