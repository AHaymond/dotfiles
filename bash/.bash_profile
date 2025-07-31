#
# ~/.bash_profile
#

export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /opt/homebrew/bin/rbenv ]; then
  eval "$(/opt/homebrew/bin/rbenv init - bash)"
fi
# load nvm for managing node versions
export NVM_DIR="$HOME/.nvm"
if [ $(uname) == "Darwin" ]; then
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi
eval "$(direnv hook bash)"

export PATH="$PATH:/home/grunklestan/.dotfiles/bin/.local/bin"
