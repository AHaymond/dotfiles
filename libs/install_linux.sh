#!/bin/bash

. ./libs/install_checks.sh
. ./libs/install_functions.sh
DOTFILES_FOLDER="$(basename $(dirname "$(readlink -fm "$0")"))"

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
ln -sf $DOTFILES_FOLDER/git/.gitignore $HOME/
stow ruby_essentials && echo "✓ ruby essentials"
stow terraform && echo "✓ terraform"

cat <<EOF
Done.
EOF

