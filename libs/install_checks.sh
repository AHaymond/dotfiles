#!/bin/bash

if [ -z "$(command -v stow)" ]; then
  cat <<EOF

  'stow' is required to be able to install:

      pacaur -S           <-- On Arch
      apt install stow    <-- On Ubuntu
      brew install stow   <-- On Mac
EOF
  exit 1
fi
