function bd() {
  if [ $# -eq 0 ]; then bun dev; else bun "$@"; fi
}

function bp() {
  bun dev --port "$@"
}

function bi() {
  if [ $# -eq 0 ]; then bun i; else bun i "$@"; fi
}

function bid() {
  bun i -D "$@"
}

function bg() {
  bun i -g "$@"
}

function be() {
  bunx "$@"
}

function prettierAll() {
  bunx prettier --write .
}

function deleteNodeModules() {
  find . -type d -name node_modules -prune -print | xargs rm -rf
}

function brf() {
  find . -type d -name node_modules -prune -print | xargs rm -rf
  rm -f bun.lock bun.lockb
  bun i
}
