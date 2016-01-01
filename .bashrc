alias s="ls -FG"
alias sa="ls -aFG" 

# because permissions
alias plz='sudo $(history -p !!)'

# because humor
alias 山="say yama"

# compile and run c++11
function go {
    g++ -g -std=c++11 $@ && ./a.out
}

# find within current folder
# good hack until I actually learn the find command 
function f {
    find . -type f -name $1
}

# because job control should just be ctrl-z & z
function z {
    %$1
}

