#!/bin/bash
sed -i "s/PS1=.*/PS1='\\\[\\\e\[1;32m\\\]\[\\\u@\\\A \\\w]\\\\$\\\[\\\e\[0m\\\] \'/" $HOME/.bashrc
sudo sed -i "s/PS1=.*/PS1='\\\[\\\e\[1;31m\\\]\[\\\u@\\\A \\\w]\\\\$\\\[\\\e\[0m\\\] \'/" /root/.bashrc
