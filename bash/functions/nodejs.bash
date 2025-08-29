bd() {
  if [ $# -eq 0 ]; then bun dev; else bun "$@"; fi
}

bp() {
  bun dev --port "$@"
}

bi() {
  if [ $# -eq 0 ]; then bun i; else bun i "$@"; fi
}

bid() {
  bun i -D "$@"
}

bg() {
  bun i -g "$@"
}

be() {
  bunx "$@"
}

prettierAll() {
  bunx prettier --write .
}

deleteNodeModules() {
  find . -type d -name node_modules -prune -print0 | xargs -0 rm -rf
}

brf() {
  find . -type d -name node_modules -prune -print0 | xargs -0 rm -rf
  rm -f bun.lock bun.lockb
  bun i
}