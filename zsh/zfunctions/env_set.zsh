function x() {
  if [ $# -eq 1 ]; then
    export $1
  elif [ $# -ge 2 ]; then
    export $1="${@:2}"
  else
    echo "Usage: x VARIABLE [VALUE]"
    return 1
  fi
}