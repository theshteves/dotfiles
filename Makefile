PWD=$(shell pwd)

#.PHONY: all
all: brew
	ln -fs $(PWD)/.bash_profile ~/
	ln -fs $(PWD)/.bashrc ~/
	ln -fs $(PWD)/.vimrc ~/
	ln -fs $(PWD)/.emacs ~/
	ln -fs $(PWD)/.gitconfig ~/
	ln -fs $(PWD)/.gitignore_global ~/
	cp $(PWD)/fonts/lucida-console.ttf ~/Library/Fonts/ # TODO: Update terminal preferences (bash, font, text color: #46DEEB)

brew:
ifeq ($(command -v brew), "")
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	brew update
endif
	brew bundle --file $(PWD)/Brewfile
