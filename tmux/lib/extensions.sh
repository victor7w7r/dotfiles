#!/usr/bin/env bash

ext_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd ../ && pwd)"

(
  while :; do
    tmux has-session 2>/dev/null || exit
    "$ext_dir"/extensions/git.sh
    "$ext_dir"/extensions/ssh_session.sh
    "$ext_dir"/extensions/network_ping.sh
    "$ext_dir"/extensions/ram_info.sh
    "$ext_dir"/extensions/cpu_info.sh
    "$ext_dir"/extensions/battery.sh
    sleep 0.1
  done
) &
