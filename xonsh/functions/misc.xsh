from pathlib import Path
from shutil import which, move
from sys import platform

def _equals(cmd):
  cmd_path = which(cmd)
  if cmd_path: return str(Path(cmd_path).resolve())
  return f"Command '{cmd}' not found"

def _bak(filepath):
  if not filepath:
    print("1 path must be supplied")
    return False

  path = Path(filepath)
  if filepath.endswith('.bak'): file_base = filepath[:-4]
  else: file_base = filepath

  backup_path = Path(f"{file_base}.bak")

  if path.exists():
    if backup_path.exists():
      temp_path = Path(f"{backup_path}.tmp")
      move(str(path), str(temp_path))
      move(str(backup_path), str(path))
      move(str(temp_path), str(backup_path))
    else: move(str(path), str(backup_path))
  else:
    if backup_path.exists(): move(str(backup_path), str(path))
    else:
      print(f"Neither {path} nor {backup_path} exist")
      return False
    return True

def _ex():
  path = Path(filepath)
  if not path.is_file():
    print(f"'{filepath}' is not a valid file")
    return False

  filename = path.name
  foldername = path.stem
  folder_path = Path(foldername)
  folder_path.mkdir(exist_ok=True)

  try:
    if filename.endswith(('.tar.bz2', '.tbz2')):
      !(tar xjf @(filepath) -C @(foldername))
    elif filename.endswith(('.tar.gz', '.tgz')):
      !(tar xzf @(filepath) -C @(foldername))
    elif filename.endswith('.bz2'):
      !(bunzip2 -k @(filepath))
      move(filename[:-4], f"./{foldername}/")
    elif filename.endswith('.rar'):
      !(unrar x @(filepath) @(f"./{foldername}/"))
    elif filename.endswith('.gz'):
      !(gunzip -k @(filepath))
      move(filename[:-3], f"./{foldername}/")
    elif filename.endswith('.tar'):
      !(tar xf @(filepath) -C @(f"./{foldername}/"))
    elif filename.endswith('.zip'):
      !(unzip -d @(f"./{foldername}/") @(filename))
    elif filename.endswith('.Z'):
      !(uncompress @(filename))
      move(filename[:-2], f"./{foldername}/")
    elif filename.endswith('.7z'):
      !(7z x @(filename) @(f"-o./{foldername}/"))
    else:
      print(f"'{filename}' cannot be extracted via ex()")
      return False
    return True
  except Exception as e:
    print(f"Error extracting {filename}: {e}")
    return False

def _mkcd(dirpath):
  !(mkdir -p @(dirpath))
  cd @(dirpath)

def _mvcd(source, dest):
  if not source or not dest:
    print("Both source and destination required")
    return
  !(mkdir -p @(dest))
  !(mv @(source) @(dest))
  cd @(dest)

def _cheat(*args):
  if which('navi'):
    cmd = ['navi', '--print', '--fzf-overrides', '--no-multi --no-height --no-sort']
    if args: cmd.extend(['--query'] + list(args))
    @(cmd)
  else:
    print("navi not found")

def _cwd():
  current_dir = str(Path.cwd()).replace(str(Path.home()), '~')
  if platform == "linux":
    echo @(current_dir) | xclip -selection clipboard -i
  elif platform == "darwin":
    echo @(current_dir) | pbcopy
  if 'TMUX' in __xonsh__.env:
    echo @(current_dir) | tmux load-buffer -

def _dus(*args):
  if which('dust'):
    !(dust -r -d 1 @(args))
  else:
    !(du -h --max-depth=1 @(args))

def _fkill():
  if not which('fzf'):
    print("fzf not found")
    return

  try:
    if platform == "linux":
      result = $(ps -f -u $USER | sed 1d | fzf)
      if result: pid = result.split()[1]
    elif platform == "darwin":
      result = $(ps -f -u $USER | sed 1d | fzf)
      if result: pid = result.split()[2]
    else:
      print('Error: unknown platform.')
      return
    if pid:
      print(f"Killing PID: {pid}")
      !(kill -9 @(pid))
  except Exception as e:
    print(f"Error: {e}")

def _mux(*args):
  if len(args) == 1 and args[0] == "stop":
    session = $(tmux display-message -p '#S').strip()
    !(tmuxinator stop @(session))
  else:
    !(tmuxinator @(args))

def _emptytrash():
  if platform == "darwin":
    !(sudo rm -rfv /Volumes/*/.Trashes)
    !(sudo rm -rfv ~/.Trash)
    !(sudo rm -rfv /private/var/log/asl/*.asl)
    try:
      !(sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent')
    except:
      pass
  else: print("This function is for macOS only")

def _tka():
  try:
    sessions = $(tmux ls | cut -d : -f 1).strip().split('\n')
    for session in sessions:
      if session:
        !(tmux kill-session -t @(session))
  except:
    print("No tmux sessions found")

def _tna():
  session_name = Path.cwd().name.replace('.', '-')
  !(tmux new-session -As @(session_name))

def _bin(filepath):
  if not filepath:
    print("File path required")
    return

  real_path = Path(filepath).resolve()
  if not real_path.exists():
    print(f"File {filepath} does not exist")
    return

  !(ln -sr @(str(real_path)) /usr/local/bin/)

def _s(*args):
  !(sudo @(args))

def _f(pattern):
  if not pattern:
    print("Search pattern required")
    return
  !(find . -name @(f"*{pattern}*") 2>/dev/null)

def _path_add(new_path):
  if not new_path:
    print("Path required")
    return

  current_path = __xonsh__.env.get('PATH', '')
  path_list = current_path.split(':')

  if new_path not in path_list:
    path_list.append(new_path)
    __xonsh__.env['PATH'] = ':'.join(path_list)
    print(f"Added {new_path} to PATH")
  else:
    print(f"{new_path} already in PATH")

  print(f"Updated PATH: {__xonsh__.env['PATH']}")

def _compress(archive_name, *files):
  if not archive_name or not files:
    print('usage: compress <foo.tar.gz> ./foo ./bar')
    return

  files_list = list(files)

  try:
    if archive_name.endswith('.tar'):
      !(tar cf @(archive_name) @(files_list))
    elif archive_name.endswith('.tar.bz2'):
      !(tar cjf @(archive_name) @(files_list))
    elif archive_name.endswith(('.tar.gz', '.tgz')):
      !(tar czf @(archive_name) @(files_list))
    elif archive_name.endswith('.zip'):
      !(zip @(archive_name) @(files_list))
    elif archive_name.endswith('.rar'):
      !(rar @(archive_name) @(files_list))
    else:
      tar_name = f"{archive_name}.tar.gz"
      !(tar zcvf @(tar_name) @(files_list))
      print(f"Created {tar_name}")
  except Exception as e:
    print(f"Error compressing: {e}")


aliases['equals'] = _equals
aliases['bak'] = _bak
aliases['ex'] = _ex
aliases['mkcd'] = _mkcd
aliases['mvcd'] = _mvcd
aliases['cheat'] = _cheat
aliases['cwd'] = _cwd
aliases['dus'] = _dus
aliases['fkill'] = _fkill
aliases['mux'] = _mux
aliases['emptytrash'] = _emptytrash
aliases['tka'] = _tka
aliases['tna'] = _tna
aliases['bin'] = _bin
aliases['s'] = _s
aliases['f'] = _f
aliases['path_add'] = _path_add
aliases['compress'] = _compress