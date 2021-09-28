if [ -z "$(pgrep "ssh-agent")" ]; then
  eval "$(ssh-agent)" > /dev/null
fi
