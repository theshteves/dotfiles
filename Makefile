# Prereqs: git (for installing dotfiles) & make (for running this)
#git?no, make, vim, (fortune, cowsay, lolcat),
#TODO: migrate from Makefile to pure bash setup script. Turns out make is an unnecessary dependency with the variety of devices I'm hopping around

PWD=$(shell pwd)

#.PHONY: common
common:
	case "$$OSTYPE" in \
		darwin*) \
			echo "TODO:  make darwin" \
			;; \
		linux*) \
			echo "TODO:  make linux" \
			;; \
		*) \
			echo "TODO:  make [obscure OSTYPE]" \
			;; \
	esac
	ln -sfn $(PWD)/.bash_profile ~/
	ln -sfn $(PWD)/.bashrc ~/
	ln -sfn $(PWD)/.digrc ~/
	ln -sfn $(PWD)/.emacs ~/
	ln -sfn $(PWD)/.gitconfig ~/
	ln -sfn $(PWD)/.gitignore_global ~/
	ln -sfn $(PWD)/.vimrc ~/
	source ~/.bash_profile
	#ln -sfn $(PWD)/nixos.config ~/.config  # TODO: fix non-recursion's hack below
	#ln -sfn $(PWD)/nixos.config/home-manager/home.nix ~/.config/home-manager/

darwin: common
	cp $(PWD)/fonts/lucida-console.ttf ~/Library/Fonts/ # TODO: Update terminal prefs (shell, font, color: #46DEEB, window: 120 x 48)
	if [ $(command -v brew) == "" ] ; then curl -fsSL https://raw.githubuserco    ntent.com/Homebrew/install/master/install.sh | /bin/bash; else brew update;     fi
	brew bundle --file $(PWD)/Brewfile
