#
# Example:
# 1jason@gravityj:~$ cd src/rc/
# 2jason@gravityj6m:~/src/rc$ 
#
# Features:
# * Color
# * Shows dirs depth, if using dirs hack
# * Shows git branch name in shorthand when in a git repo
# * Spicy @

function dirs_depth () {
    echo `dirs -v | wc -l`
}

function parse_git_branch () {
    BRANCH=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ "$BRANCH" = '' ]
    then printf ''
    else
        BLEN=$(echo `echo $BRANCH | wc -c` " - 1" | bc)
        echo ${BLEN}$(echo $BRANCH | cut -c1)
    fi
}

function extra_color () {
    NUM=;
    let "NUM = $RANDOM % 100";
    if [ $NUM -lt 30 ]
    then
        echo -e "\033[34m"
    fi
}

PS1='\[\e[0;31m\]$(dirs_depth)\[\e[0;32m\]\u\[$(extra_color)\]∈\[\e[0;32m\]\h\[\e[0m\]\[\e[0;33m\]$(parse_git_branch)\[\e[0m\]:\w ζ '
