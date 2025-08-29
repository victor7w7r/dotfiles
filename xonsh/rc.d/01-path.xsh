def _path():
  from os import path

  for dir in [
    '/bin',
    '/usr/bin',
    '/usr/local/bin',
    '/usr/local/sbin',
    '/usr/local/xenv/bin',
    '/home/linuxbrew/.linuxbrew/bin',
    f'{$HOME}/local/bin',
    f'{$HOME}/.bin',
    f'{$HOME}/.cargo/bin',
    f'{$HOME}/.venv/bin'
  ]:
    if path.isdir(dir) and path.exists(dir):
      $PATH.add(dir, front=True, replace=True)
    $PATH.add('node_modules/.bin', front=True, replace=True)

  for func in  __import__('glob').glob(
    path.join(path.expanduser("~/.config/xonsh/functions"), "*.xsh")
  ):
    source @(func)

_path()
del _path