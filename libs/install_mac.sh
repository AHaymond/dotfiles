#!/bin/bash

. ./libs/install_checks.sh
. ./libs/install_functions.sh

cat <<EOF
Installing configs for Mac ...
EOF

# Desktop
#install_bash && echo "✓ bash"
stow bash && echo "✓ bash"

# Dev
stow vim && echo "✓ vim"
stow tmux && echo "✓ tmux"
stow git && echo "✓ git"

cat <<EOF
Done.
EOF
