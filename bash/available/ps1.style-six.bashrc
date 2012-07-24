function dirs_depth () {
    echo `dirs -v | wc -l`
}

function parse_git_branch () {
    BRANCH=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    BLEN=$(echo `echo $BRANCH | wc -c` " - 1" | bc)
    echo $BRANCH | cut -c1 | sed -e "s/^./${BLEN}\0/"
}

function extra_color () {
    NUM=;
    let "NUM = $RANDOM % 100";
    if [ $NUM -lt 30 ]
    then
        echo -e "\033[34m"
    fi
}

PS1='\[\e[0;31m\]$(dirs_depth)\[\e[0;32m\]\u$(extra_color)@\[\e[0;32m\]\h\[\e[0m\]\[\e[0;33m\]$(parse_git_branch)\[\e[0m\]:\w\$ '
