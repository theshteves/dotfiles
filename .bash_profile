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
TEMP_MULTILINE_STRING
)
case "$OSTYPE" in
  darwin*)
    printf "$WELCOME_MSG \n" | lolcat -a -d 1 &
    #printf "$WELCOME_MSG \n $(fortune -s | cowsay -f dragon) \n" | lolcat -a -d 1 &
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
#export LC_ALL="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"


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
  : '
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"

  export GIT_PROMPT_START="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]"
  export GIT_PROMPT_END="\[\033[0;32m\]\$ \[\033[0m\]"
  export GIT_PROMPT_THEME=Solarized
  '
  export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]\[\033[0;32m\]\$ \[\033[0m\]"
else
  export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]\[\033[0;32m\]\$ \[\033[0m\]"
fi

case "$OSTYPE" in
  darwin*)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export ENABLE_GATSBY_REFRESH_ENDPOINT=1


export PATH="/user/local/sbin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH:/Users/stevenkneiser/go/bin"
export PGDATABASE=postgres

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Add RVM to PATH for scripting. Make sure this is the absolute last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Java
export PATH="/usr/local/opt/openjdk@17/bin:$PATH"
;;
  linux*)
export SYSTEMD_EDITOR=vim
;;
esac

wait # Wait for Welcome Message subprocess

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/stevenkneiser/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
