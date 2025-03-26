function equals() {
  realpath $(which $1)
}

function bak() {
  if [ $# -ne 1 ]; then
    echo "1 path must be supplied"
    return 1
  fi
  file=$(basename "$1" '.bak')
  other="$file.bak"
  if [ -e "$1" ]; then
    if [ -e "$other" ]; then
      mv "$1" "$other.tmp"
      mv "$other" "$1"
      mv "$other.tmp" "$other"
    else
      mv "$1" "$other"
    fi
  else
    if [ -e "$other" ]; then
      mv "$other" "$1"
    else
      echo "Neither $1 nor $other exist"
      return 1
    fi
  fi
}

function ex() {
  if [ -f "$1" ]; then
    filename=$(basename "$1")
    foldername=$(echo "$filename" | sed 's/\.[^.]*$//')
    mkdir -p "$foldername"
    case "$1" in
    *.tar.bz2)
      tar xjf "$1" -C "$foldername"
      ;;
    *.tar.gz)
      tar xzf "$1" -C "$foldername"
      ;;
    *.bz2)
      bunzip2 -k "$1"
      mv "$(basename "$1" .bz2)" "./$foldername/"
      ;;
    *.rar)
      unrar x "$1" "./$foldername/"
      ;;
    *.gz)
      gunzip -k "$1"
      mv "$(basename "$1" .gz)" "./$foldername/"
      ;;
    *.tar)
      tar xf "$1" -C "./$foldername/"
      ;;
    *.tbz2)
      tar xjf "$1" -C "./$foldername/"
      ;;
    *.tgz)
      tar xzf "$1" -C "./$foldername/"
      ;;
    *.zip)
      unzip -d "./$foldername/" "$filename"
      ;;
    *.Z)
      uncompress "$filename"
      mv "$(basename "$filename" ".Z")" "./$foldername/"
      ;;
    *.7z)
      7z x "$filename" "-o./$foldername/"
      ;;
    *)
      echo "'$filename' cannot be extracted via ex()"
      ;;
    esac
  else
    echo "'$filename' is not a valid file"
  fi
}

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

function mvcd() {
  if [ $# -gt 1 ]; then
    mkdir -p "$2"
    mv "$1" "$2"
    cd "$2"
  fi
}

function ranger() {
  if [ -z "$RANGER_LEVEL" ]; then
    tempfile=$(mktemp -t tmp.XXXXXX)
    command ranger --choosedir="$tempfile" "$@"
    return_value=$?

    if [ -s "$tempfile" ]; then
      ranger_pwd=$(cat "$tempfile")
      if [ -n "$ranger_pwd" ] && [ -d "$ranger_pwd" ]; then
        cd -- "$ranger_pwd"
      fi
    fi

    rm -f -- "$tempfile"
    return $return_value
  else
    exit
  fi
}

function cheat() {
  navi_command='navi --print --fzf-overrides "--no-multi --no-height --no-sort"'
  if [ $# -eq 0 ]; then
    eval $navi_command
  else
    eval $navi_command --query "$@"
  fi
}

function cwd() {
  if [ "$OS" = "Linux" ]; then
    echo -n "$(echo $PWD | sed "s|^$HOME|~|")" | tr -d "\r\n" | xclip -selection clipboard -i
  elif [ "$OS" = "Darwin" ]; then
    echo -n "$(echo $PWD | sed "s|^$HOME|~|")" | tr -d "\r\n" | pbcopy
  fi
  # También copia al buffer de tmux si está activo
  if [ -n "$TMUX" ]; then
    echo -n "$(echo $PWD | sed "s|^$HOME|~|")" | tr -d "\r\n" | tmux load-buffer -
  fi
}

function dus() {
  command dust -r -d 1 "$@"
}

function fkill() {
  local pids
  if [ "$OS" = "Linux" ]; then
    pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
  elif [ "$OS" = "Darwin" ]; then
    pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
  else
    echo 'Error: unknown platform.'
    return
  fi
  echo "$pids"
  if [ -n "$pids" ]; then
    echo "$pids" | xargs kill -9 "$@"
  fi
}

function mux() {
  if [ $# -eq 1 ] && [ "$1" = "stop" ]; then
    tmuxinator stop "$(tmux display-message -p '#S')"
  else
    tmuxinator "$@"
  fi
}

function tnew() {
  tmux new -s "$(basename $(pwd) | cut -d'.' -f1)"
}

function beep() {
  echo -e '\a'
  sleep 0.1
  echo -e '\a'
}

function clone() {
  git clone --depth=1 "$1"
  cd "$(basename "$1" | sed 's/.git$//')"
  yarn install
}

function emptytrash() {
  sudo rm -rfv /Volumes/*/.Trashes
  sudo rm -rfv ~/.Trash
  sudo rm -rfv /private/var/log/asl/*.asl
  sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
}

function c_prettyping() {
  echo ""
  if [ $# -eq 0 ]; then
    prettyping --nolegend "1.1.1.1"
  else
    prettyping --nolegend "$@"
  fi
}

function treload() {
  tmux source-file ~/.config/tmux/tmux.conf
  tmux display-message "TMUX Config Reloaded"
}

function path() {
  echo $PATH | tr ":" "\n" | nl
}

function reload() {
  exec zsh "$@"
}

function tka() {
  tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}
}

function tn() {
  tmux new -s "$1"
}

function tna() {
  tmux new-session -As "$(basename "$PWD" | tr . -)"
}

function bin() {
  ln -sr "$(realpath "$1")" /usr/local/bin/
}

function s() {
  sudo "$@"
}

function f() {
  find . -name "*$1*" 2>/dev/null
}

function path_add() {
  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
  echo "Updated PATH: $PATH"
}

function manpdf() {
  man -t "$1" | open -f -a /Applications/Preview.app
}

compress() {
  if [[ -n "$1" ]]; then
    local file=$1
    shift
    case "$file" in
    *.tar) tar cf "$file" "$*" ;;
    *.tar.bz2) tar cjf "$file" "$*" ;;
    *.tar.gz) tar czf "$file" "$*" ;;
    *.tgz) tar czf "$file" "$*" ;;
    *.zip) zip "$file" "$*" ;;
    *.rar) rar "$file" "$*" ;;
    *) tar zcvf "$file.tar.gz" "$*" ;;
    esac
  else
    echo 'usage: compress <foo.tar.gz> ./foo ./bar'
  fi
}
