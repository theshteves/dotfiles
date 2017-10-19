##
# .bash_profile
#
# Author:       Steven Kneiser
# Created:      02/06/2015
# Last updated: 10/19/2017

# Halt script if shell isn't interactive
if [ -z "$PS1" ]; then
  return
fi


# "We program for the world." --Charles Owen
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"


# General customizations
export EDITOR="vim"


# Less file-viewer customizations
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline


# Construct my unparalleled prompt-string
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"

  export GIT_PROMPT_START="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]"
  export GIT_PROMPT_END="\[\033[0;32m\]\$ \[\033[0m\]"
  export GIT_PROMPT_THEME=Solarized

else
  export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]\[\033[0;32m\]\$ \[\033[0m\]"
fi

source ~/.git-completion


# My personal shortcuts
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Print a cool session header
WELCOME=$(cat <<-WELCOME_MSG
  ██████  ██ ▄█▀ ███▄    █ ▓█████  ██▓  ██████ ▓█████  ██▀███  
▒██    ▒  ██▄█▒  ██ ▀█   █ ▓█   ▀ ▓██▒▒██    ▒ ▓█   ▀ ▓██ ▒ ██▒
░ ▓██▄   ▓███▄░ ▓██  ▀█ ██▒▒███   ▒██▒░ ▓██▄   ▒███   ▓██ ░▄█ ▒
  ▒   ██▒▓██ █▄ ▓██▒  ▐▌██▒▒▓█  ▄ ░██░  ▒   ██▒▒▓█  ▄ ▒██▀▀█▄  
▒██████▒▒▒██▒ █▄▒██░   ▓██░░▒████▒░██░▒██████▒▒░▒████▒░██▓ ▒██▒
▒ ▒▓▒ ▒ ░▒ ▒▒ ▓▒░ ▒░   ▒ ▒ ░░ ▒░ ░░▓  ▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ▒▓ ░▒▓░
░ ░▒  ░ ░░ ░▒ ▒░░ ░░   ░ ▒░ ░ ░  ░ ▒ ░░ ░▒  ░ ░ ░ ░  ░  ░▒ ░ ▒░
░  ░  ░  ░ ░░ ░    ░   ░ ░    ░    ▒ ░░  ░  ░     ░     ░░   ░ 
      ░  ░  ░            ░    ░  ░ ░        ░     ░  ░   ░     
.
WELCOME_MSG
)

echo "$WELCOME $(fortune -s | cowsay -f dragon)" | lolcat -a -d 1
