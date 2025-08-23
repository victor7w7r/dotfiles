from os import path
from pathlib import Path

func_dir = Path("~/.config/xonsh/functions")

$path_dir = [
  '/bin',
  '/usr/bin',
  '/usr/local/bin',
  '/usr/local/sbin',
  'node_modules/.bin',
  f'{$HOME}/local/bin',
  f'{$HOME}/.bin',
  f'{$HOME}/.cargo/bin',
  f'{$HOME}/.xenv/bin',
  f'{$HOME}/.venv/bin'
]

for dir in $path_dir:
  if path.isdir(dir) and path.exists(dir): $PATH.add(dir, front=True, replace=True)

for file in [
  str(path) for path in func_dir.rglob("*.xsh") if path.parent != func_dir
]:
  execx(f"source {file}")
