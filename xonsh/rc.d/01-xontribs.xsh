import os

_xontribs = [
  ("abbrevs", "xontrib-abbrevs"),
  ("autoxsh", "xonsh-autoxsh"),
  ("argcomplete", "xontrib-argcomplete"),
  ("fzf-completions", "xontrib-fzf-completions"),
  ("jump_to_dir", "xontrib-jump-to-dir"),
  ("dalias", "xontrib-dalias"),
  ("back2dir", "xontrib-back2dir"),
  ("broot", "xontrib-broot"),
  ("dir-picker", "xontrib-dir-picker"),
  ("clp", "xontrib-clp"),
  ("sh", "xontrib-sh"),
  ("jedi", "xontrib-jedi"),
  ("free_cwd", "xontrib-free-cwd"),
  ("docker_tabcomplete", "xonsh-docker-tabcomplete"),
  ("pipeliner", "xontrib-pipeliner"),
  ("zoxide", "xontrib-zoxide"),
  ("fish_completer", "xontrib-fish-completer"),
  ("vox", "xontrib-vox"),
  ("whole_word_jumping", "xontrib-whole-word-jumping"),
  ("prompt_starship", "xontrib-prompt-starship"),
  #("dotdot", "xontrib-dotdot"),
  #("homebrew","xontrib-homebrew"),
]

def _xontrib_load(xontr, pkg):
  result = !(xontrib load @(xontr))
  if result.returncode != os.EX_OK:
    print(f"Installing xontrib: {xontr}")
    xpip install @(pkg)

for _xontrib, _pkg in _xontribs: _xontrib_load(_xontrib, _pkg)

del _xontrib_load
del _xontribs
del _xontrib
del _pkg
