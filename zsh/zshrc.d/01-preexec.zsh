if [[ -o interactive && -z "$TMUX" && -x "$(command -v tmux)" && "$TERM_PROGRAM" != "vscode" && -z "$SSH_TTY" ]]; then
  exec tmux -2 -f "$HOME/.config/tmux/tmux.conf"
fi
