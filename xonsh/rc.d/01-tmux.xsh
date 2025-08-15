if __xonsh__.env.get("FBTERM") is not None: $TERM = 'fbterm'

if __xonsh__.env.get("XONSH_INTERACTIVE") == "1" \
  and __xonsh__.env.get("TMUX") is None \
  and commandexist("tmux") is not None \
  and __xonsh__.env.get("TERM_PROGRAM") != "vscode" \
  and __xonsh__.env.get("SSH_TTY") is None:
  
  execx("tmux -f ~/.config/tmux/tmux.conf", locs=globals())