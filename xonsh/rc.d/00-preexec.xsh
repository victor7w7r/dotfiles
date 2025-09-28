def _preexec():
  env = __xonsh__.env

  if (
    env.get('XONSH_INTERACTIVE') in (True, '1', 'True') or env.get('XONSH_MODE') == 'interactive'
  ) and env.get('TMUX') is None \
    and __import__('shutil').which('tmux') is not None \
    and env.get('TERM_PROGRAM') != 'vscode' \
    and env.get('SSH_TTY'):
      __import__('os').execvp(
        'tmux',
        ['tmux', '-f', f"{env['HOME']}/.config/tmux/tmux.conf"]
      )

_preexec()
del _preexec
