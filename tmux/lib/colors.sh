#!/usr/bin/env bash

colors_cake=(
  "#2BB7FB"
  "#f38ba8"
  "#b4befe"
  "#7088ff"
  "#89dceb"
  "#cba6f7"
  "#e4cfff"
)

colors_secondary=(
  "#b71c1c"
  "#ef6c00"
  "#f9a825"
  "#2e7d32"
  "#1565c0"
  "#6a1b9a"
  "#5d4037"
)

colors_alt=(
  "#89dceb"
  "#7088ff"
  "#89dceb"
  "#7088ff"
  "#89dceb"
  "#7088ff"
  "#89dceb"
)

colors_alt2=(
  "#f38ba8"
  "#cba6f7"
  "#e4cfff"
  "#f38ba8"
  "#cba6f7"
  "#e4cfff"
  "#f38ba8"
)

colors_alt3=(
  "#b71c1c"
  "#f9a825"
  "#b71c1c"
  "#f9a825"
  "#b71c1c"
  "#f9a825"
  "#b71c1c"
)

rotate_left() {
  local -a arr=("$@")
  local first="${arr[0]}"
  arr=("${arr[@]:1}" "$first")
  printf "%s\n" "${arr[@]}"
}

rotate_right() {
  local -a arr=("$@")
  local last="${arr[-1]}"
  arr=("$last" "${arr[@]:0:${#arr[@]}-1}")
  printf "%s\n" "${arr[@]}"
}

randomize_colors() {
  local -a input_array=("$@")
  local array_length=${#input_array[@]}
  local random_index_one=$((RANDOM % 7))
  local random_index_two=$((RANDOM % 7))

  [[ $random_index_one -eq $random_index_two ]] && random_index_two=$(((random_index_two + 1) % 8))

  local color_one=${input_array[$random_index_one]}
  local color_two=${input_array[$random_index_two]}

  local -a repeated_colors=()
  for ((i = 0; i < array_length / 2; i++)); do
    repeated_colors+=("$color_one" "$color_two")
  done

  if ((array_length % 2 != 0)); then
    repeated_colors+=("$color_one")
  fi

  printf "%s\n" "${repeated_colors[@]}"
}

random_palette() {
  case $(((RANDOM % 2) + 1)) in
  1) randomize_colors "${colors_cake[@]}" ;;
  2) randomize_colors "${colors_secondary[@]}" ;;
  esac
}

random_colors() {
  case $(((RANDOM % 6) + 1)) in
  1) echo "${colors_alt[@]}" ;;
  2) echo "${colors_alt2[@]}" ;;
  3) echo "${colors_alt3[@]}" ;;
  4) random_palette ;;
  5) echo "${colors_cake[@]}" ;;
  6) echo "${colors_secondary[@]}" ;;
  esac
}

random_single_color() {
  local random_index=$((RANDOM % 7))
  case $(((RANDOM % 2) + 1)) in
  1) echo "${colors_cake[$random_index]}" ;;
  2) echo "${colors_secondary[$random_index]}" ;;
  esac
}

rotate_colors() {
  read -r -a selected_colors <<<"$(random_colors)"
  variable_colors=("${selected_colors[@]}")

  for ((i = 0; i < ${#selected_colors[@]}; i++)); do
    if [[ -z "$1" ]]; then
      read -r -a variable_colors <<<"$(rotate_left "${variable_colors[@]}")"
    else
      read -r -a variable_colors <<<"$(rotate_right "${variable_colors[@]}")"
    fi
    if [[ -z "$2" ]]; then sleep 0.5; else sleep "$2"; fi
    echo "${variable_colors[@]}"
  done
}

random_choose() {
  local assign_colors=()
  local isright=0
  randomOne=$(awk -v r="$RANDOM" 'BEGIN { printf "%.1f", (r % 991) / 10 + 0.1 }')
  randomTwo=$(awk -v r="$RANDOM" 'BEGIN { printf "%.1f", (r % 991) / 10 + 0.1 }')
  local integerOne=random=${randomOne%.*}
  local integerTwo=random=${randomTwo%.*}

  if ((integerOne % 2 == 0 && integerTwo % 2 == 0)); then
    read -r -a assign_colors <<<"$(rotate_colors $isright "$randomOne")"
  elif ((integerOne % 2 == 0 && integerTwo % 2 != 0)); then
    read -r -a assign_colors <<<"$(rotate_colors $isright)"
  elif ((integerOne % 2 != 0 && integerTwo % 2 == 0)); then
    unset -v isright
    read -r -a assign_colors <<<"$(rotate_colors "$isright" "$randomOne")"
  else
    read -r -a assign_colors <<<"$(rotate_colors)"
  fi
  echo "${assign_colors[@]}"
}
