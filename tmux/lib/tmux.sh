#!/usr/bin/env bash

get_pid() { tmux list-panes -F "#{?pane_active,#{pane_pid},}"; }

right_status() {
  tmux set-option -ga status-right \
    "#{?#{==:$2,},,#[fg=$1,nobold,nounderscore,noitalics] #[fg=#cdd6f4,bg=$1] $2}"
}

secondary_right_status() {
  tmux set-option -g status 2
  tmux set -g 'status-format[1]' \
    "#[fg=$1,nobold,nounderscore,noitalics,align=right] #[fg=#cdd6f4,bg=$1] $2 "
}

empty_secondary_right_status() {
  tmux set-option -g status 2
  tmux set -g 'status-format[1]' ""
}

disable_secondary_right_status() { tmux set-option -gu status; }

update_status() {
  local -a colorsarr=("$@")

  right_status "${colorsarr[0]}" "#(cat /tmp/git.exectmux)"
  right_status "${colorsarr[1]}" "#(cat /tmp/ssh_session.exectmux)"
  right_status "${colorsarr[2]}" "#(cat /tmp/network_ping.exectmux)"
  right_status "${colorsarr[3]}" "#(cat /tmp/ram_info.exectmux)"
  right_status "${colorsarr[4]}" "#(cat /tmp/cpu_info.exectmux)"
  right_status "${colorsarr[5]}" "#(cat /tmp/battery.exectmux)"
  right_status "${colorsarr[6]}" "%%d-%b %I:%M%P "
  #right_status "#e4cfff" "#($current_dir/network.sh)"
  #right_status "#e4cfff" "#($current_dir/mpc.sh)"
  #right_status "#e4cfff" "#($current_dir/sys_temp.sh)"
}
