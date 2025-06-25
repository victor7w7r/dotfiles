if [[ -o interactive && -z "$TMUX" && -x "$(command -v tmux)" && "$TERM_PROGRAM" != "vscode" && -z "$SSH_TTY" ]]; then
  exec tmux -f "$HOME/.config/tmux/tmux.conf"
fi

if command -v mommy &>/dev/null; then
  set -o PROMPT_SUBST
  RPS1='$(mommy -c ${ZDOTDIR}/bin/mommy -1 -s $?)'
fi
