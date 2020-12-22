function _setup_projects_go_path() {
  if [ ! -e "$HOME/Projects/.go" ]; then
    mkdir -p $HOME/Projects/.go/bin
  fi
  export GOPATH="${HOME}/Projects/.go"
  export GOBIN="${HOME}/Projects/.go/bin"
}

if [ -e "${HOME}/.go" ]; then
  export GOPATH="${HOME}/.go"
elif [ -e "$HOME/Projects" ]; then
  _setup_projects_go_path
fi

# Set path to look in GOBIN
if [ -e /usr/local/go ]; then
  export PATH="${PATH}:/usr/local/go/bin"
elif [ -e "${GOPATH}/bin" ]; then
  export PATH="${PATH}:${GOBIN}"
fi

if [ -d $HOME/.gvm ]; then
  [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
#else
#  if [ -n "$(command -v go)" ]; then
#    newgopath="$(echo $GOPATH | sed 's/:/\/bin:/g')/bin"
#    export PATH="${PATH}:${newgopath}"
#  fi
fi
[ -n "$(command -v bunch)" ] && eval "$(bunch shim -)"
