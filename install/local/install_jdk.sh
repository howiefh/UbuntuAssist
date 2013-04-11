#!/bin/bash
ver=1_7
sudo mv jdk$ver /usr/lib/jvm/jdk$ver

# 设置环境变量
text='\nexport JAVA_HOME=/usr/lib/jvm/jdk'$ver'\nexport JRE_HOME=${JAVA_HOME}/jre\nexport CLASSPATH=.:${JAVA_HOME}/lib:${JAVA_HOME}/lib\nexport PATH=.:${JAVA_HOME}/bin:$PATH'
echo -e $text >> $HOME/.bashrc

# text2='\nPATH=$PATH:/usr/lib/jvm/jdk'$ver'/bin\nCLASSPATH=.:/usr/lib/jvm/jdk'$ver'/lib\nJAVA_HOME=/usr/lib/jvm/jdk'$ver
# sudo sh -c 'echo -e $text2 >> /etc/environment'

sudo sh -c "echo PATH=$PATH:/usr/lib/jvm/jdk$ver/bin >> /etc/environment"
sudo sh -c "echo CLASSPATH=.:/usr/lib/jvm/jdk$ver/lib >> /etc/environment"
sudo sh -c "echo JAVA_HOME=/usr/lib/jvm/jdk$ver >> /etc/environment"
# 替换默认java
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk$ver/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk$ver/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk$ver/bin/jar 300
sudo update-alternatives --config java

