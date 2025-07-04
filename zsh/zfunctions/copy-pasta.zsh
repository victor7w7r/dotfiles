copy() { (
  local copy_pasta_folder="/tmp/copy-pasta"
  set -u
  set -e
  setopt +o nomatch

  if [ $# -lt 1 ]; then
    cat <<EOF
Usage:

  copy <files and directories to copy>

  pasta [destination dir]
    If destination dir is omitted the current directory is used.
    If the destination dir does not exist it will be created.
EOF
    return 1
  fi

  if [ -d "$copy_pasta_folder" ]; then
    rm -rf "${copy_pasta_folder:?}"/{*,.*} 2>/dev/null || true
  else
    mkdir "$copy_pasta_folder"
  fi

  cp -r "$@" "$copy_pasta_folder"

); }

pasta() { (
  local copy_pasta_folder="/tmp/copy-pasta"
  set -u
  set -e
  setopt +o nomatch

  if [ $# -gt 1 ]; then
    cat >&2 <<EOF
Usage:

  copy <files and directories to copy>

  pasta [destination dir]
    If destination dir is omitted the current directory is used.
    If the destination dir does not exist it will be created.
EOF
    return 1
  elif [ $# -eq 0 ]; then
    local dest="."
  else
    local dest="$1"
    if ! [ -d "$dest" ]; then
      echo "Creating $dest directory" >&2
      mkdir -p "$dest"
    fi
  fi

  if [ ! -d "$copy_pasta_folder" ]; then
    cat >&2 <<EOF
Remember to copy before you pasta!
EOF
    return 1
  fi

  cp -r "$copy_pasta_folder"/{*,.*} "$dest" 2>/dev/null || true
); }
