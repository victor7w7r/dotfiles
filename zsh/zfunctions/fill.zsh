function fill() {
  local left_cmd="$1"
  local right_cmd="$2"
  local fill_char=" "
  local cols=$(tput cols)

  local fill_width=$((cols - ${#left_cmd} - ${#right_cmd}))

  printf "%s%*s%s\n" "$left_cmd" "$fill_width" "$fill_char" "$right_cmd"
}
