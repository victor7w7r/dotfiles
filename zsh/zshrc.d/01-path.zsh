typeset -gU path fpath

path=(
  /bin
  /usr/bin
  /usr/local/bin
  /usr/local/sbin
  node_modules/.bin
  "$HOME/.bin"
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "/opt/brew/bin"
  "$HOME/.config/emacs/bin"
  $path
)
fpath=("$ZSH/completions" $fpath)

for zfunction in ${ZDOTDIR}/functions/*.zsh; do source $zfunction; done; unset zfunction
