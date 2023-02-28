if [ -a /opt/homebrew/Library/Homebrew/brew.rb ]; then
  #export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
