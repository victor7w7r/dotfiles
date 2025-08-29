#!/bin/bash
case $- in
	*i*) ;;
  *) return ;;
esac

export BASHDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

for conf in "$BASHDOTDIR"/bashrc.d/*.bash; do [ -f "$conf" ] && source "$conf"; done
unset conf

[[ -f "$BASHDOTDIR/.private" ]] && source "$BASHDOTDIR/.private"
