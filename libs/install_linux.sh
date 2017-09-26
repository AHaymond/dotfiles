#!/bin/bash

. ./libs/install_checks.sh
. ./libs/install_functions.sh

cat <<EOF
Installing configs for Linux ...
EOF

# Desktop
#install_bash && echo "✓ bash"
stow bash && echo "✓ bash"
stow dunst && echo "✓ dunst"
stow polybar && echo "✓ polybar"
stow user_systemd && echo "✓ user_systemd"
stow wallpaper && echo "✓ wallpaper"
sudo stow bin && echo "✓ bin"
sudo stow -t / x11 && echo "✓ x11"
sudo mv /.xinitrc $HOME/

# Dev
stow vim && echo "✓ vim"
stow tmux && echo "✓ tmux"
stow git && echo "✓ git"

cat <<EOF
Done.
EOF

