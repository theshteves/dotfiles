###############################################{{{
#
# Steven Kneiser's dope .bashrc
# 
# Raw version:
#   https://raw.githubusercontent.com/theshteves/dotfiles/master/.bashrc
#
# Navigating this .bashrc w/folds:
#   I provided manual fold markers so you can shrink and expand this file at 
#   your pleasure so first enable folding in you current buffer:
#   
#   	:set foldmethod=marker
#
#	Now you can press "za" within any Section to shrink/expand multiple lines
#
# Sections:
#   -> General
#   -> Status
#   -> Navigation
#   -> Editor
#   -> Version Control
#   -> Miscellaneous
#   -> Machine-specific
# 
###############################################}}}
#
# GENERAL
#
###############################################{{{
# Halt script if shell isn't interactive
if [ -z "$PS1" ]; then
  return
fi

alias a="alias"
alias b="tput bell"
#function c { cd $(printf "%0.s../" {1..${1}}; )} # cd "../" * arg1
alias d="vimdiff"
alias e="emacs -nw"
alias f="find . -name"
alias ff="find . -type f -name"
alias fd="find . -type d -name"
alias l="less"
alias m="man"
alias v="vim"
#alias y=""
function z { %${1}; } # job control: ctrl-z & z

# Safe actions
alias cp="cp -i"
alias ln="ln -i"
alias mv="mv -i"
alias rm="rm -i"


###############################################}}}
#
# STATUS
#
###############################################{{{
alias s="ls -FG"
alias sa="ls -aFG" 
alias sd="cd" # sue me
alias se="printenv"
function sg { grep -rni --color=always "${1}" . | less; }
function sloc { find . -name "${1}" | xargs wc -l | sort; }
alias sp="ps aux"
alias sr="ls -aFGR | less"
alias sz="jobs"


###############################################}}}
#
# NAVIGATION
#
###############################################{{{
alias n="clear && ls -FG && echo && git status -s --untracked-files=normal"
alias na="clear && ls -aFG && echo && git status -s --untracked-files=normal"
function no { echo ${*} >> ~/.notes; } # because I'm a thoughtful guy

# Search history for next alias
alias new="history | awk '{print $2}' | sort | uniq -c | sort"


###############################################}}}
#
# EDITOR
#
###############################################{{{
# vim
alias vi="vim"
alias vim="vim" # ...just in case
alias vmi="vim"
alias ivm="vim"
alias imv="vim"
alias mvi="vim"
alias miv="vim"

# Emacs
alias ec="emacs -nw ~/.emacs"

# If you don't use tmux, you're missing out
alias ta="tmux attach -t"
alias td="tmux detach"
alias tk="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new-session -s"


###############################################}}}
#
# VERSION CONTROL
#
###############################################{{{
# Git... you're the best
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gd="git diff"
alias gf="git fetch"
alias gg="git grep"
alias gl="git log --graph --pretty=oneline --abbrev-commit --decorate"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"

# Perforce... you're the worst
alias pf="p4"
alias pd="p4 describe -S -du"


###############################################}}}
#
# MISCELLANEOUS
#
###############################################{{{
alias 山="say yama"
alias advice="fortune -s | say"
alias play="mpg123 ~/.soundcloud2000/*.mp3"
alias plz='sudo $(history -p !!)'
function gx { g++ -g -std=c++11 $@ && ./a.out; }

# Package Management made simple
function brewall {
	brew update
	brew upgrade
	brew prune
	brew cleanup
	brew doctor
}


###############################################}}}
#
# MACHINE-SPECIFIC
#
###############################################{{{
# OS X push notification
function notify {
    _notif='display notification '"${1}"' with title '"${2}"
    reattach-to-user-namespace osascript -e $_notif
}

# Muh daily python
function python4 {
    cd $(find ~ -type d -name 'cpython' -maxdepth 6 -print -quit)

    if [ $# -ne 0 ]; then
        clear
        git pull cpython master
        read -n 1 -s -r -p "Press any key to continue..."

        clear
        ./configure --with-pydebug && make -j
        read -n 1 -s -r -p "Press any key to continue..."

        clear
        ./python.exe -m test -j3
        read -n 1 -s -r -p "Press any key to continue..."
    fi

	clear
	./python.exe
	cd -
}
