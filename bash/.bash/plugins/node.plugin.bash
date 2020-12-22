## For nvm
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

## For nodenv
if [ -d $HOME/.nodenv ]; then
  export NODENV_ROOT="$HOME/.nodenv"
  export PATH="$HOME/.nodenv/bin:$PATH"
  if [ -n "$(which nodenv)" ]; then
    eval "$(nodenv init -)"
  fi
fi
