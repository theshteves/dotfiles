###############################################{{{
#
# Steven Kneiser's dope .bashrc
# 
# Raw version:
#   https://raw.githubusercontent.com/theshteves/dotfiles/master/.bashrc
#
# Navigating this .bashrc w/folds:
#   I already inserted manual fold markers within this file
#   so you can quickly shrink & expand this file.
#
#   Enable folding in your current buffer:
#   	:set foldmethod=marker
#
#	  Now you can press:
#     * za -> Toggles open or closed IF cursor is within a fold
#     * zR -> Open  ALL folds
#     * zM => Close ALL folds
#     * :h fold -> Open help pages for more ideas (:q! to quit)
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
alias uplay="/Users/kneiser/Library/Application\ Support/Steam/steamapps/common/Assassins\ Creed\ Brotherhood/Assassin\'s\ Creed\ Brotherhood.app/Contents/MacOS/acbmp_sf"
alias b="tput bell"
#function c { cd $(printf "%0.s../" {1..${1}}; )} # cd "../" * arg1
alias d="docker"
alias dc="docker container"
alias di="docker image"
alias dl="docker logs"
alias dn="docker network"
alias dp="docker ps"
alias e="emacs -nw"
alias f="find . -name"
alias ff="find . -type f -name"
alias fd="find . -type d -name"
alias k="kubectl"
alias l="less --LINE-NUMBERS --LONG-PROMPT --CLEAR-SCREEN --squeeze-blank-lines --ignore-case --hilite-search --RAW-CONTROL-CHARS --SILENT --HILITE-UNREAD"
alias m="man"
alias mr="make run"
alias v="vim"
alias vd="vimdiff"
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
case "$OSTYPE" in
  darwin*)
alias s="ls -FG"
alias sa="ls -aFG"
alias sl="ls -lFG"
alias sla="ls -alFG"
alias sal="ls -alFG"
alias st="ls -FGtr"
alias sta="ls -aFGtr"
alias sat="ls -aFGtr"
alias sr="ls -aFGR | less"
;;
  *)
alias s="ls -F --color=auto"
alias sa="ls -aF --color=auto" 
alias sl="ls -lF --color=auto"
alias sla="ls -alF --color=auto"
alias sal="ls -alF --color=auto"
alias st="ls -Ftr --color=auto"
alias sta="ls -aFtr --color=auto"
alias sat="ls -aFtr --color=auto"
alias sr="ls -aFR --color=auto | less"
;;
esac

alias sd="cd" # sue me
alias se="printenv"
function sg { grep -rni --color=always "${1}" . | less; }
alias sj="jupyter notebook"
function sloc { find . -name "${1}" | xargs wc -l | sort; }
alias sm="mail -v"
alias sp="ps aux"
alias sz="jobs"


###############################################}}}
#
# NAVIGATION
#
###############################################{{{
alias ff="find . -type f -name"
alias fd="find . -type d -name"
case "$OSTYPE" in
  darwin*)
alias n="clear && ls -FG && echo && git status -s --untracked-files=normal"
alias na="clear && ls -aFG && echo && git status -s --untracked-files=normal --long --verbose"
;;
  *)
alias n="clear && ls -F --color=auto && echo && git status -s --untracked-files=normal"
alias na="clear && ls -aF --color=auto && echo && git status -s --untracked-files=normal --long --verbose"
;;
esac

function no { echo ${*} >> ~/.notes; } # because I'm a thoughtful thinkboi
alias on="open -n"

# Search history for next alias
alias new="history | awk '{print $2}' | sort | uniq -c | sort"

# Pretty-print filesystem tree
alias tree="find . | sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"


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
alias gba="git branch -a"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gd="git diff --word-diff"
alias gds="git diff --word-diff --staged"
alias gf="git fetch"
alias gfa="git fetch -a"
alias gg="git grep"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue%an %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp="git push"
alias gpr="git pull --rebase"
alias grs="git restore --staged"
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
alias packet-loss="ping -A 1.1.1.1"
function gx { g++ -g -std=c++2x $@ && ./a.out; }

# Package Management made simple
function gimme {
  case "$OSTYPE" in
    darwin*)
	brew update
	brew upgrade
	brew cleanup #--prune-prefix #brew prune
	#brew cleanup
	brew doctor
  ;;
  esac
}


###############################################}}}
#
# MACHINE-SPECIFIC
#
###############################################{{{
# OS X push notification
function notify {
  case "$OSTYPE" in
    darwin*)
  _notif='display notification '"${1}"' with title '"${2}"
  reattach-to-user-namespace osascript -e $_notif
  ;;
  esac
}

# Muh daily python
function python4 {
    cd $(find ~ -type d -name 'cpython' -maxdepth 4 -print -quit)

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
