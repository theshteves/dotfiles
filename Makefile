PWD=$(shell pwd)

#.PHONY: all
all: brew
	ln -fs $(PWD)/.bash_profile ~/
	ln -fs $(PWD)/.bashrc ~/
	ln -fs $(PWD)/.vimrc ~/
	ln -fs $(PWD)/.emacs ~/
	ln -fs $(PWD)/.gitconfig ~/
	ln -fs $(PWD)/.gitignore_global ~/
	cp $(PWD)/fonts/lucida-console.ttf ~/Library/Fonts/ # TODO: Update terminal prefs (shell, font, color: #46DEEB, window: 120 x 48)

brew:
	if [ $(command -v brew) == "" ] ; then curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash; else brew update; fi
	brew bundle --file $(PWD)/Brewfile
