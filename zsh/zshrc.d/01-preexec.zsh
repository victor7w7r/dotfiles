[[ -n "${FBTERM}" ]] && export TERM=fbterm

[[ 
  -o interactive &&
  -z "$TMUX" &&
  -x "$(command -v tmux)" &&
  "$TERM_PROGRAM" != "vscode" &&
  -z "$SSH_TTY" ]] &&
  exec tmux -f "$HOME/.config/tmux/tmux.conf"

CACHE_DIR="${ZSHEXECDIR}/cache"
ZINIT_HOME="${ZSHEXECDIR}/zinit/zinit.git"

[[ ! -d "${CACHE_DIR}/completions" ]] && mkdir -p "$CACHE_DIR/completions"
(( ${fpath[(Ie)"$CACHE_DIR/completions"]} )) || fpath=("$CACHE_DIR/completions" $fpath)

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
