function is-macos() {
  [[ $OSTYPE = *darwin* ]] || return 1
}

function is-linux() {
  [[ $OSTYPE = *linux* ]] || return 1
}
