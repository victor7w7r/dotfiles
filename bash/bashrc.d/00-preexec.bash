if [[ $- == *i* ]] && \
  [[ -z "$TMUX" ]] && \
  command -v tmux >/dev/null 2>&1 && \
  [[ "$TERM_PROGRAM" != "vscode" ]] && \
  [[ -z "$SSH_TTY" ]]; then
    exec tmux -f "$HOME/.config/tmux/tmux.conf"
fi
