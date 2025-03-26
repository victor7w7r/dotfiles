function random-opts() {
  local options=(-b -d -g -p -s -t -w -y)
  echo ${options[$RANDOM % ${#options[@]} + 1]}
}
