#if [ -n "$(which docker &> /dev/null)" ]; then
#  if [ -n "$(which boot2docker &> /dev/null)" ]; then
#    $(boot2docker shellinit 2>/dev/null)
#  fi
#fi
#

# Bash completion (required for MacOS Docker Desktop)
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
