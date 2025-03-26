function unmommy() {
  unset RPS1
}

function setmommy() {
  RPS1='$(mommy -1 -s $?)'
}