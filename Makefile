PWD=$(shell pwd)

#.PHONY: all
all: brew
	ln -fs $(PWD)/.bash_profile ~/
	ln -fs $(PWD)/.bashrc ~/
	ln -fs $(PWD)/.vimrc ~/
	ln -fs $(PWD)/.emacs ~/
	ln -fs $(PWD)/.gitconfig ~/
	ln -fs $(PWD)/fonts ~/ # Open up MacOS "Font Book" to add font

brew:
ifeq ($(command -v brew), "")
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	brew update
endif
	brew bundle --file $(PWD)/Brewfile
