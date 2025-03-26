function zupdate() {
  zinit update --parallel 40
}

function zselfupdate() {
  zinit self-update
}

function zreset() {
  rm -rf "${ZSH}/zinit" &>/dev/null
  rm -rf "${HOME}/local/share/zinit" &>/dev/null
}
