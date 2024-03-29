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
#function c { cd $(printf "%0.s../" {1..${1}}; )} # cd "../" * arg1
alias d="docker"
alias dc="docker container"
function de { docker exec -it ${1} /bin/bash --login; }
alias di="docker image"
alias dl="docker logs"
alias dn="docker network"
alias dp='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dcup="docker compose up -d"
alias dcupf="docker compose up -d && docker compose --follow logs"
alias dcdown="docker compose down"
#alias docker-compose="docker compose"
alias e="emacs -nw"
alias j="jupyter notebook"
alias k="kubectl"
alias kg="kubectl get"
alias kga="kubectl get ns | awk '{print \$1}' | tail -n +2 | xargs -I % sh -c 'echo \"==> \\033[31;1;4m%\\033[0m\"; kubectl get -n % all; echo \"\\n\"'"
function l { $(history -p !!) | less --LINE-NUMBERS --LONG-PROMPT --CLEAR-SCREEN --squeeze-blank-lines --ignore-case --hilite-search --RAW-CONTROL-CHARS --SILENT --HILITE-UNREAD; }
#TODO: function l should capture the previous command's stdout into `less`, or at very least re-execute it (even though that would be problematic with stateful commands)
alias m="man"
alias ma="make -j 7"
#alias t is taken for 'temp' below
alias v="vim"
alias vd="vimdiff"
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
alias fb="du -ht 1G \. 2>/dev/null | sort -hr"
function ff { find \. -type f -maxdepth ${2-5} -name "${1}" "${@:3}" 2> /dev/null; }
function fd { find \. -type d -maxdepth ${2-5} -name "${1}" "${@:3}" 2> /dev/null; }

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
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue%an %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --remotes=origin HEAD"
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


###############################################}}}
#
# MACHINE-SPECIFIC
#
###############################################{{{
# Package Management made simple
function gimme {
  case "$OSTYPE" in
    darwin*)
      brew update
      brew upgrade
      brew cleanup #--prune-prefix #brew prune
      brew doctor
      ;;
    linux*)
      if [ -x "$(command -v apk)" ];        then sudo apk update && sudo apk upgrade # Alpine
      elif [ -x "$(command -v apt-get)" ];  then sudo apt-get update && sudo apt-get upgrade # Debian
      elif [ -x "$(command -v dnf)" ];      then sudo dnf up --ref # Fedora
      elif [ -x "$(command -v pacman)" ];   then sudo pacman -Syyu # Arch
      else echo "What?\nWhat kind of no-name package manager are you even using?">&2;
      fi
      ;;
  esac
}


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


alias b="btm --battery --fahrenheit --enable_gpu_memory --enable_cache_memory --current_usage  --unnormalized_cpu --left_legend --network_use_log --rate=250"
alias psst="netstat -p tcp -van | grep '^Proto\|LISTEN' | awk '{print \$9}' | tail -n +2 | sort | xargs ps -p"
alias sniff="dumpcap -i 1 -w ~/data/pcapng/sniff.pcapng -b filesize:500000 -b files:10"


case "$OSTYPE" in
  linux*)
    alias t=""
    echo
    ;;
  darwin*)
    alias t="sudo powermetrics | grep 'temp'"
    alias netins="networksetup -listallhardwareports"
    alias net_ins="ifconfig | grep -e '^[a-z]' | awk '{print substr(\$1, 1, length(\$1) - 1)}' | sort"
    alias wifi_analyzer="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | tail -n +2 | awk '{print \$1,\$2,\$3,\$4}' | sort -k 2"
    echo
    ;;
  *)
    echo
    ;;
esac


alias llama="~/code/llama.cpp/main -m ~/code/llama.cpp/models/llama-2-13b-chat.ggmlv3.q4_0.bin \
  --color \
  --ctx_size 2048 \
  -n -1 \
  -ins -b 256 \
  --top_k 10000 \
  --temp 0.2 \
  --repeat_penalty 1.1 \
  -t 8"


alias wolfram="ffplay -f lavfi -i cellauto=rule=110"
alias wolfram2="ffplay -f lavfi -i life=s=300x200:mold=10:r=60:ratio=0.1:death_color=#C83232:life_color=#00ff00,scale=1200:800:flags=16"
alias wolfram3="ffplay -f lavfi -i mandelbrot"


alias forecast="~/code/misc/weather.sh"

#TODO: NixOS
alias hor="home-manager switch --flake ~/dotfiles/nixos.config#vbox"
alias nor="sudo cp ~/dotfiles/nixos.config/nixos/* /etc/nixos/; sudo nixos-rebuild switch"
alias eh="vim ~/dotfiles/nixos.config/home-manager/home.nix"
alias en="vim ~/dotfiles/nixos.config/nixos/configuration.nix"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/stevenkneiser/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
