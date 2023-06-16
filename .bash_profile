##
# .bash_profile
#
# Author:       Steven Kneiser
# Created:      02/06/2015
# Last updated: 06/16/2023

# Halt script if shell isn't interactive
if [ -z "$PS1" ]; then
  return
fi

if [[ ! $SHELL =~ bash ]]; then
    echo "What? No bash??\nYou stuck me in [${SHELL}]?!!\nNo dotfiles for you."
    return
fi


# Print a cool session header, reminding me that I'm home
WELCOME_MSG=$(cat <<-TEMP_MULTILINE_STRING
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
TEMP_MULTILINE_STRING
)
case "$OSTYPE" in
  darwin*)
echo "$WELCOME_MSG $(fortune -s | cowsay -f dragon)" | lolcat -a -d 1 &
;;
  *)
echo "$WELCOME_MSG" &
;;
esac
# The "&" forks off into a new process. The forced 1-second delay covers up the setup execution below more seamlessly


# My personal shortcuts
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


# "We program for the world." --Charles Owen
export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"


# General customizations
export BASH_SILENCE_DEPRECATION_WARNING=1 # Apple can't make me use zsh >:]
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

case "$OSTYPE" in
  darwin*)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi



;;
esac

wait # Wait for Welcome Message subprocess
