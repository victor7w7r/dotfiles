def _xontrib_load(xontr, pkg):
  from os import EX_OK

  if !(xontrib load @(xontr)).returncode != EX_OK:
    print(f'Installing xontrib: {xontr}')
    xpip install @(pkg)

def _xontribs():
  from shutil import which

  for xontrib, pkg in [
    ('abbrevs', 'xontrib-abbrevs'),
    ('argcomplete', 'xontrib-argcomplete'),
    ('autoxsh', 'xonsh-autoxsh'),
    ('back2dir', 'xontrib-back2dir'),
    ('clp', 'xontrib-clp'),
    ('dalias', 'xontrib-dalias'),
    ('dir-picker', 'xontrib-dir-picker'),
    ('fish_completer', 'xontrib-fish-completer'),
    ('free_cwd', 'xontrib-free-cwd'),
    ('jedi', 'xontrib-jedi'),
    ('jump_to_dir', 'xontrib-jump-to-dir'),
    ('pipeliner', 'xontrib-pipeliner'),
    ('sh', 'xontrib-sh'),
    ('vox', 'xontrib-vox'),
    ('whole_word_jumping', 'xontrib-whole-word-jumping'),
    #('homebrew','xontrib-homebrew'),
    #('dotdot', 'xontrib-dotdot'),
  ]: _xontrib_load(xontrib, pkg)


  if which('broot'): _xontrib_load('broot', 'xontrib-broot')
  if which('direnv'): _xontrib_load('direnv', 'xonsh-direnv')
  if which('fzf'): _xontrib_load('fzf-completions', 'xontrib-fzf-completions')
  #if which('mise'): _xontrib_load('mise', 'xontrib-mise')
  if which('thefuck'): _xontrib_load('thefuck', 'xontrib-thefuck')
  if which('zoxide'): _xontrib_load('zoxide', 'xontrib-zoxide')
  if which('docker') or which('podman'):
    _xontrib_load('docker_tabcomplete', 'xonsh-docker-tabcomplete')
  if which('carapace'): exec($(carapace _carapace))
  if which('systemctl'): $(systemctl --user import-environment PATH)

_xontribs()
del _xontrib_load
del _xontribs