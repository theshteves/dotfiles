PWD=$(shell pwd)

#.PHONY: all
all: links packages
	cp $(PWD)/fonts/lucida-console.ttf ~/Library/Fonts/ # TODO: Update termina    l prefs (shell, font, color: #46DEEB, window: 120 x 48)

packages:
	#TODO: split into OS-specific branches here
	if [ $(command -v brew) == "" ] ; then curl -fsSL https://raw.githubuserco    ntent.com/Homebrew/install/master/install.sh | /bin/bash; else brew update;     fi
	brew bundle --file $(PWD)/Brewfile

links:
	ln -fs $(PWD)/.bash_profile ~/
	ln -fs $(PWD)/.bashrc ~/
	ln -fs $(PWD)/.digrc ~/
	ln -fs $(PWD)/.emacs ~/
	ln -fs $(PWD)/.gitconfig ~/
	ln -fs $(PWD)/.gitignore_global ~/
	ln -fs $(PWD)/.vimrc ~/
	source $(PWD)/.bash_profile
