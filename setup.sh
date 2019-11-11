#!/bin/bash

NAME="Wes van der Vleuten"
EMAIL="me@wes.cloud"

echo "osconfig by WesVleuten";
echo "Starting now...";
echo "----";

if [ "$(uname)" == "Darwin" ]; then
	echo "Starting macOS installer...";
	sleep 1;
	sh ./lib/install_mac.sh;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Starting Linux installer...";
	sleep 1;
	sh ./lib/install_ubuntu.sh;
else
	echo "Could not detect os";
	exit;
fi

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh";

	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	chsh -s $(which zsh);

	echo "[NOTICE] Please exit your terminal after installation";

else
	echo "Skipping oh-my-zsh";
fi

if [ ! -f ~/.vim/bundle/Vundle.vim/README.md ]; then
	echo "Installing Vundle";
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
else
	echo "Skipping installing Vundle";
fi

if [ ! -f ~/.ssh/id_rsa ]; then
	echo "Generating id_rsa";
	ssh-keygen -t rsa -b 4096 -C "workstation" -f ~/.ssh/id_rsa;

	# make sure ssh-agent is running, then add id_rsa to the agent
	eval "$(ssh-agent -s)" > /dev/null;
	ssh-add ~/.ssh/id_rsa;
else
	echo "Skipping id_rsa";
fi

echo "Installing zsh plugins";
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Creating link for .vimrc config";
ln -f ./vimrc ~/.vimrc;

echo "Adding vim header";
mkdir -p ~/.vim/after/plugin
ln -f ./wheader.vim ~/.vim/after/plugin

echo "Installing vim plugins";
vim +PluginInstall +qall;

echo "Please check if the date has been set correctly:";
date;
echo "Done!";

