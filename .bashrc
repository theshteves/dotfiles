alias a="alias"
alias m="man"
alias s="ls -FG"
alias sa="ls -aFG" 

# because permissions
alias plz='sudo $(history -p !!)'

# because japanese
alias 山="say yama"

# If you don't use tmux, you're missing out
alias tgo="tmux attach -t dev"

# compile and run c++11
function go {
    g++ -g -std=c++11 $@ && ./a.out
}

# because job control should just be ctrl-z & z
function z {
    %$1
}

