#
# ~/.bash_profile
#

export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -f $HOME/.bashrc ]] && source $HOME/.bashrc

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(/opt/homebrew/bin/rbenv init - bash)"
# load nvm for managing node versions
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
eval "$(direnv hook bash)"
