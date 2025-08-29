def _preexec():
  env = __xonsh__.env

  if env.get('FBTERM') is not None: $TERM = 'fbterm'
  if env.get('_XONSH_PREEXEC_DONE'): return
  $_XONSH_PREEXEC_DONE = '1'

  if (
    env.get('XONSH_INTERACTIVE') in (True, '1', 'True') or env.get('XONSH_MODE') == 'interactive'
  ) and not env.get('TMUX') \
    and __import__('shutil').which('tmux') is not None \
    and env.get('TERM_PROGRAM') != 'vscode' \
    and env.get('SSH_TTY') is None \
    and not env.get('_XONSH_TMUX_STARTED'):
      $_XONSH_TMUX_STARTED = '1'
      __import__('os').execvp(
        'tmux',
        ['tmux', '-f', f"{env['HOME']}/.config/tmux/tmux.conf"]
      )

_preexec()
del _preexec