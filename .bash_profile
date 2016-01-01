##
# .bash_profile
#
# Author:       Steven Kneiser
# Created:      02/06/2015
# Last updated: 12/31/2015

cat <<WELCOME_MSG
 _______ _     _ _______  ______ _     _ _______ _______ _     _ _______  ______
(_______|_)   (_|_______)/ _____|_)   (_|_______|_______|_)   (_|_______)/ _____)
    _    _______ _____  ( (____  _______    _    _____   _     _ _____  ( (____
   | |  |  ___  |  ___)  \____ \|  ___  |  | |  |  ___) | |   | |  ___)  \____ \\
   | |  | |   | | |_____ _____) ) |   | |  | |  | |_____ \ \ / /| |_____ _____) )
   |_|  |_|   |_|_______|______/|_|   |_|  |_|  |_______) \___/ |_______|______/
WELCOME_MSG

export PATH=$PATH:/usr/local/bin
export EDITOR="vim"
export PS1="\[\033[0;32m\][\D{%m/%d/%y %r}] \u:\W$\[\033[0m\] "

source ~/.bashrc
