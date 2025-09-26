import uuid

def starship_prompt():
  last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
  status = last_cmd.rtn if last_cmd else 0
  jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
  duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0
  return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration))

def starship_rprompt():
  env = __xonsh__.env
  last_cmd = __xonsh__.history[-1] if __xonsh__.history else None
  status = last_cmd.rtn if last_cmd else 0
  jobs = sum(1 for job in __xonsh__.all_jobs.values() if job['obj'] and job['obj'].poll() is None)
  duration = round((last_cmd.ts[1] - last_cmd.ts[0]) * 1000) if last_cmd else 0

  if (
    env.get('XONSH_INTERACTIVE') in (True, '1', 'True') or env.get('XONSH_MODE') == 'interactive'
  ) and env.get('TMUX') is None \
    and __import__('shutil').which('tmux') is not None \
    and env.get('TERM_PROGRAM') != 'vscode' \
    and env.get('SSH_TTY') is None:

    tmux set-environment -g LAST_EXIT @(str(status))
    tmux set-environment -g LAST_CMD_TS $(date +%s%N)

  return $(starship prompt --status=@(status) --jobs=@(jobs) --cmd-duration=@(duration) --right)

if __import__('shutil').which('starship'):
  $PROMPT = starship_prompt
  $RIGHT_PROMPT = starship_rprompt
  $STARSHIP_SHELL = "xonsh"
  $STARSHIP_SESSION_KEY = uuid.uuid4().hex