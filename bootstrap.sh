#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
git submodule init
git submodule update

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
	source ~/.bash_profile;
	
	# Install rust programming language
	# curl -sSf https://static.rust-lang.org/rustup.sh | sh
	# Install Nodejs 5.x version
	# curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
	# sudo apt-get install -y nodejs
	# Install typescript bower gulp
	# sudo npm install -g typescript bower gulp
	# Install other dependencies needed for YouCompleteMe
	# sudo apt-get install -y build-essential cmake python-dev python3-dev mono-complete gccgo-go
	# Install all the vim plugins
	vim +PluginInstall +qall #install all the vim plugins
	# Install YouCompleteMe for all languagues
	# cd ~/.vim/bundle/YouCompleteMe
	# ./install.py --all
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
