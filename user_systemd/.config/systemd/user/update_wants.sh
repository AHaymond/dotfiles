#!/bin/bash

for f in ./*; do
  if [ -f $f ] && [ "${f##*.}" == "service" ]; then
    ln -sf $(readlink -f $f | sed 's/\.dotfiles\/user_systemd\///') xorg.target.wants/
  fi
done
