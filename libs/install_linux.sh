#!/bin/bash

. ./libs/install_checks.sh
. ./libs/install_functions.sh

cat <<EOF
Installing configs for Linux ...
EOF

# Desktop
stow bash && echo "✓ bash"
stow dunst && echo "✓ dunst"
stow polybar && echo "✓ polybar"
stow i3 && echo "✓ i3"
stow user_systemd && echo "✓ user_systemd"
stow wallpaper && echo "✓ wallpaper"
sudo stow bin && echo "✓ bin"
sudo stow -t / x11 && echo "✓ x11"

# Dev
stow vim && echo "✓ vim"
stow tmux && echo "✓ tmux"
stow git && echo "✓ git"
stow terraform && echo "✓ terraform"

cat <<EOF
Done.
EOF

