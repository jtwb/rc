# Load rbebv, if you are using it
VERSION=`cat $HOME/.rbenv/version`
export PATH="$HOME/.rbenv/versions/$VERSION/bin:$HOME/.rbenv/bin:$PATH"
[[ `which rbenv` ]] && eval "$(rbenv init -)"

# Load the auto-completion script if rbenv was loaded.
[[ -e ~/.rbenv/completions/rbenv.bash ]] && source ~/.rbenv/completions/rbenv.bash

