#!/usr/bin/env bash
# shellcheck source=/dev/null

set_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$set_dir"/tmux.sh
source "$set_dir"/colors.sh

KAOMOJI=""
ACTUALPROCESS=""
ACTUALCOLOR="$(random_single_color)"

shorten_string() {
  local str="$1"
  local len=${#str}

  if ((len <= 70)); then
    echo "$str"
  else
    local start=${str:0:50}
    local end=${str: -50}
    echo "${start}...${end}"
  fi
}

setup_foreground() {
  if [[ "$1" == "zsh" || "$1" == "starship" ||
    "$1" == "tmux" || "$1" == "nvim" || "$1" == "xonsh" ]] \
    ; then
    KAOMOJI=""
    disable_secondary_right_status
  elif [[ "$1" != "$ACTUALPROCESS" || -z "$KAOMOJI" ]]; then
    ACTUALPROCESS="$1"
    ACTUALCOLOR="$(random_single_color)"
    KAOMOJI="$(source "$HOME"/.config/zsh/zfunctions/kaomoji.zsh && kaomoji)"
    disable_secondary_right_status
  else
    secondary_right_status "$ACTUALCOLOR" "${KAOMOJI} $(shorten_string "$2")"
  fi
}

(
  while :; do
    tmux has-session 2>/dev/null || exit
    PID=$(get_pid)
    while :; do
      kill -0 "$PID" 2>/dev/null || break
      tty=$(ps -p "$PID" -o tty= | xargs)
      tty=${tty#/dev/}
      TPGID=$(ps -t "$tty" -o tpgid | tail -n 1 | xargs)
      [ -z "$TPGID" ] || [ "$TPGID" = "$PID" ] && break
      PID=$TPGID
    done
    [ "$PID" -eq "$PID" ] 2>/dev/null || continue
    setup_foreground \
      "$(ps -p "$PID" -o args= | awk '{print $1}' | sed 's|.*/||')" \
      "$(ps -o command= -p "$PID")"
    sleep 0.2
  done
) &
