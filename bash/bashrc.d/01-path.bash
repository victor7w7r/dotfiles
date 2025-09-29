#!/bin/bash

paths=(
  /bin
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  node_modules/.bin
  "$HOME/.bin"
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.venv/bin"
)

for p in "${paths[@]}"; do if [ -d "$p" ]; then PATH="$p:$PATH"; fi; done
export PATH

for func in "$BASHDOTDIR"/functions/*.bash; do [ -f "$func" ] && source "$func"; done
unset func