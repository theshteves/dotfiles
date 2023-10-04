# Prereqs: git (for installing dotfiles) & make (for running this)
#git?no, make, vim, (fortune, cowsay, lolcat),
#TODO: migrate from Makefile to pure bash setup script. Turns out make is an unecesarry dependenc with the variety of devices I'm hhoppingg around

PWD=$(shell pwd)

#.PHONY: all
all: links darwin_packages
	case "$OSTYPE" in
		darwin*)
			echo "tehe"
			;;
	esac
	cp $(PWD)/fonts/lucida-console.ttf ~/Library/Fonts/ # TODO: Update termina    l prefs (shell, font, color: #46DEEB, window: 120 x 48)

darwin_packages:
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
	source ~/.bash_profile
