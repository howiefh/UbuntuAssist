#!/bin/bash
ver=1_8
sudo mv jdk$ver /usr/java/jdk$ver

# 设置环境变量
text='\nexport JAVA_HOME=/usr/java/jdk'$ver'\nexport JRE_HOME=${JAVA_HOME}/jre\nexport CLASSPATH=.:${JAVA_HOME}/lib\nexport PATH=.:${JAVA_HOME}/bin:$PATH'
echo -e $text >> $HOME/.bashrc

# sudo sh -c 'echo -e $text >> /etc/environment'

# 替换默认java
sudo update-alternatives --install /usr/bin/java java /usr/java/jdk$ver/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/java/jdk$ver/bin/javac 300
sudo update-alternatives --install /usr/bin/jar jar /usr/java/jdk$ver/bin/jar 300
sudo update-alternatives --config java

