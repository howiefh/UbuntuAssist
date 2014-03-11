#!/bin/bash
# sed -i "s/PS1=.*/PS1='\\\[\\\e\[1;32m\\\]\[\\\u@\\\A \\\w]\\\\$\\\[\\\e\[0m\\\] \'/" $HOME/.bashrc
# sudo sed -i "s/PS1=.*/PS1='\\\[\\\e\[1;31m\\\]\[\\\u@\\\A \\\w]\\\\$\\\[\\\e\[0m\\\] \'/" /root/.bashrc

echo "parse_git_branch() {" >> file
echo	"git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'" >> file
echo "}" >> file
echo "PS1='\[\e[1;32m\][\u@\A \w\$(parse_git_branch)]\\$\[\e[0m\] '"  >> file
