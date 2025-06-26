export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export GPG_TTY=$(tty)
export COLORTERM="truecolor"
export SHELL="zsh"
export TERMINAL="wezterm"
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
export ZSHEXECDIR="${HOME}/.zsh"

typeset -gU path fpath

path=(
  /bin
  /usr/bin
  $HOME/.local/{,s}bin(N)
  $HOME/{,s}bin(N)
  /usr/local/{,s}bin(N)
  node_modules/.bin
  $HOME/.pyenv/bin
  $ZDOTDIR/zfunctions
  $path
)
fpath=("$ZSH/functions" "$ZSH/completions" $fpath)
