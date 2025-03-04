#!/usr/bin/bash

path=$(echo $SHELL)
bashpath="/bin/bash"
zshpath="/bin/zsh"

mv nvim-linux64 ~/
if [[ "$path" == "$bashpath" ]]; then
	cat shrc >> ~/.bashrc
	source ~/.bashrc
elif [[ "$path" == "$zshpath" ]]; then
	cat shrc >> ~/.zshrc
	source ~/.zshrc
fi
