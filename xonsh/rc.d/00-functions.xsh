from pathlib import Path

func_dir = Path('~/.config/xonsh/functions').expanduser()

for pyfile in sorted(func_dir.glob('*.py,*.xsh')):
  exec(pyfile.read_text(), globals())