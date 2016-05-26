##
# .bash_profile
#
# Author:       Steven Kneiser
# Created:      02/06/2015
# Last updated: 12/31/2015

cat <<WELCOME_MSG
  ██████  ██ ▄█▀ ███▄    █ ▓█████  ██▓  ██████ ▓█████  ██▀███  
▒██    ▒  ██▄█▒  ██ ▀█   █ ▓█   ▀ ▓██▒▒██    ▒ ▓█   ▀ ▓██ ▒ ██▒
░ ▓██▄   ▓███▄░ ▓██  ▀█ ██▒▒███   ▒██▒░ ▓██▄   ▒███   ▓██ ░▄█ ▒
  ▒   ██▒▓██ █▄ ▓██▒  ▐▌██▒▒▓█  ▄ ░██░  ▒   ██▒▒▓█  ▄ ▒██▀▀█▄  
▒██████▒▒▒██▒ █▄▒██░   ▓██░░▒████▒░██░▒██████▒▒░▒████▒░██▓ ▒██▒
▒ ▒▓▒ ▒ ░▒ ▒▒ ▓▒░ ▒░   ▒ ▒ ░░ ▒░ ░░▓  ▒ ▒▓▒ ▒ ░░░ ▒░ ░░ ▒▓ ░▒▓░
░ ░▒  ░ ░░ ░▒ ▒░░ ░░   ░ ▒░ ░ ░  ░ ▒ ░░ ░▒  ░ ░ ░ ░  ░  ░▒ ░ ▒░
░  ░  ░  ░ ░░ ░    ░   ░ ░    ░    ▒ ░░  ░  ░     ░     ░░   ░ 
      ░  ░  ░            ░    ░  ░ ░        ░     ░  ░   ░     
WELCOME_MSG

export PATH=$PATH:/usr/local/bin:/Library/Python/2.7/site-packages
export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \[\033[0;32m\]\u \[\033[0m\]\w\[\033[m\]\[\033[0;32m\]\$ \[\033[0m\]"
export EDITOR="vim"
alias vim="/usr/local/Cellar/vim/7.4.1655/bin/vim"

# Less file-viewer customizations
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# Bash aliases & functions
source ~/.bashrc

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

