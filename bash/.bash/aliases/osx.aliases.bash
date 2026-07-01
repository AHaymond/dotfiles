if [[ "$OSTYPE" =~ "darwin" ]]; then
  # Recursively delete `.DS_Store` files
  alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

  # Empty the Trash on all mounted volumes and the main HDD
  # Also, clear Apple’s System Logs to improve shell startup speed
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

  # Show/hide hidden files in Finder
  alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

  # log in to devbox via Eternal Terminal client running in docker
  # https://github.com/MisterTea/EternalTerminal/tree/master/docker
  alias devbox-connect="docker run --rm -it --name et-client -v '/Users/adam/.ssh:/root/.ssh' -e SSH_AUTH_SOCK=set et-client devbox"
fi
