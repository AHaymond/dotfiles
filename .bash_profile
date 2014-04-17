export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/usr/local/bin:$PATH

export GREP_OPTIONS='--color=always'

####################################
## functions
####################################
greps () {
  grep -iRan $1 $2 | less -R
}

work() {
  cd ~/masteryconnect
  loc=`pwd`
  name=${loc##*/}
  
  if ! tmux has-session -t "$name"; then
    tmux new-session -d -s "$name"
    tmux send-keys 'vim' C-m
    tmux split-window -v -c "$loc"
    tmux split-window -v -c "$loc"
    tmux send-keys 'rails c' C-m
    tmux split-window -v -c "$loc"
    tmux resize-pane -D 12
    tmux send-prefix t
  fi
  tmux attach -t "$name"
}

search_ruby () {
  open dash://ruby:$1
}

search_javascript () {
  open dash://javascript:$1
}

search_rails () {
  open dash://rails:$1
}
