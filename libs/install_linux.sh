#!/bin/bash

. ./libs/install_checks.sh
. ./libs/install_functions.sh
DOTFILES_FOLDER="$(basename "$(dirname "$(readlink -fm "$0")")")"

cat <<EOF
Installing configs for Linux ...
EOF

# Desktop
stow bash && echo "✓ bash"
sudo stow bin && echo "✓ bin"

# Dev
stow lazyvim && echo "✓ neovim"
stow tmux && echo "✓ tmux"
stow git && echo "✓ git"
ln -sf "$DOTFILES_FOLDER/git/.gitignore" "$HOME/"
stow ruby_essentials && echo "✓ ruby essentials"
stow terraform && echo "✓ terraform"
stow yamllint && echo "✓ yamllint"

cat <<EOF
Done.
EOF
