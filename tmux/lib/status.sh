#!/usr/bin/env bash
# shellcheck source=/dev/null

std_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$std_dir"/colors.sh
source "$std_dir"/tmux.sh

timer() {
  while :; do
    tmux has-session 2>/dev/null || exit
    read -r -a current_colors <<<"$(random_choose)"
    sleep 15
  done
}

enter_loop() {
  local BEFORE_PROCESS
  local AFTER_PROCESS
  while :; do
    tmux has-session 2>/dev/null || exit
    BEFORE_PROCESS=$(get_child_process "$(get_pid)")
    read -r
    sleep 0.5
    AFTER_PROCESS=$(get_child_process "$(get_pid)")
    [[ "$BEFORE_PROCESS" == "zsh" && "$AFTER_PROCESS" != "zsh" ]] && read -r -a current_colors <<<"$(random_choose)"
  done
}

timer &
enter_loop &

update_status "${current_colors[@]}"
