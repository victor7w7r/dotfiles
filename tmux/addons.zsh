#!/bin/zsh

function status-right() {
  tmux set-option -ga status-right "#{?#{==:$3,},,#[fg=$1,nobold,nounderscore,noitalics] #[fg=$2,bg=$1 $3}"
}

current_dir="$(dirname "${(%):-%x}")"

tmux set-option -g status-right-length 250
status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/git.sh)"
status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/ssh_session.sh)"
status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/network_ping.sh)"
status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/ram_info.sh)"
status-right "#7088ff" "#cdd6f4" "#($current_dir/addons/cpu_info.sh)"
status-right "#cba6f7" "#cdd6f4" "#($current_dir/addons/battery.sh)"
status-right "#cdd6f4" "#cdd6f4" "%%d-%b %I:%M%P"
#status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/network.sh)"
#status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/mpc.sh)"
#status-right "#e4cfff" "#cdd6f4" "#($current_dir/addons/sys_temp.sh)"

#pink='#cba6f7'
#orange='#7088ff'
#yellow='#89dceb'
#green='#e4cfff'
#cyan='#2BB7FB'
#light_purple='#b4befe'
#white='#cdd6f4'
#dark_gray='#313244'
#red='#f38ba8'
#gray='#45475a'
#dark_purple='#7088ff'
