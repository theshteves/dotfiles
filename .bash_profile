##
# .bash_profile
#
# Author:       Steven Kneiser
# Created:      02/06/2015
# Last updated: 12/27/2015

cat <<WELCOME_MSG
 _______ _     _ _______  ______ _     _ _______ _______ _     _ _______  ______
(_______|_)   (_|_______)/ _____|_)   (_|_______|_______|_)   (_|_______)/ _____)
    _    _______ _____  ( (____  _______    _    _____   _     _ _____  ( (____
   | |  |  ___  |  ___)  \____ \|  ___  |  | |  |  ___) | |   | |  ___)  \____ \\
   | |  | |   | | |_____ _____) ) |   | |  | |  | |_____ \ \ / /| |_____ _____) )
   |_|  |_|   |_|_______|______/|_|   |_|  |_|  |_______) \___/ |_______|______/
WELCOME_MSG

source ~/.bashrc
export PATH=$PATH:/Library/Python/2.7/site-packages:/usr/local/bin
export EDITOR="vim"

# because permissions
alias plz='sudo $(history -p !!)'
alias 山="echo \"YAMA!\" && say yama"

# compile and run c++11
# unalias go
function go {
    g++ -g -std=c++11 $@ && ./a.out
}

# find within current folder
unalias f
function f {
    find . -type f -name $1
}

# because job control should just be ctrl-z & z
# unalias z
function z {
    %$1
}
