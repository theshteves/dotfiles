alias a="alias"
alias m="man"
alias n="clear && ls -FG && echo && git status -s --untracked-files=normal"
alias na="clear && ls -aFG && echo && git status -s --untracked-files=normal"
alias v="vim"
alias s="ls -FG"
alias sa="ls -aFG" 
alias sd="cd" # sue me
alias pg="ps aux | grep"

# because permissions
alias plz='sudo $(history -p !!)'

# because japanese
alias 山="say yama"

# If you don't use tmux, you're missing out
alias ta="tmux attach -t"
alias td="tmux kill-session -t"
alias tl="tmux ls"
alias tn="tmux new-session -s"

# Git... you're the best
alias ga="git add"
alias gc="git commit -m"
alias gd="git diff"
alias gl="git log --graph --pretty=oneline --abbrev-commit --decorate"
alias gp="git push"
alias gs="git status"

# Quick-edit for dotfiles
alias ebp="$EDITOR ~/.bash_profile"

# compile and run c++11
function go {
    g++ -g -std=c++11 $@ && ./a.out
}

# because job control should just be ctrl-z & z
function z {
    %${1}
}

# because I'm a thoughtful guy
function no {
	echo ${*} >> ~/.notes
}

function ask {
	#local RES=python ~/bash-bot.py ${1} 
	#echo $RES
	#echo $RES | say -v Vicki 
	python ~/bash-bot.py ${1} | say -v Vicki
}
 
function translate {
 	TRANSLATED=`curl "http://dictionary.reference.com/browse/${1}" | grep -i -m 1 -w "${2}:" | sed 's/^[ \t]*//;s/[ \t]*$//'`
 	if [[ ${#TRANSLATED} != 0 ]] ;then
    	echo "\"${1}\" in ${TRANSLATED}"
    	else
    	echo "Sorry, I can not translate \"${1}\" to ${2}"
	fi
}

