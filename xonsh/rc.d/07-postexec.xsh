def _postexec():
  from shutil import which
  if __import__('sys').platform == 'darwin' and which('lolcat'):
    uname -v | lolcat
  else:
    if which('lolcat'):
      uname -m -n -o -v | lolcat
    elif which('meow'):
      uname -m -n -o -v | meow
    else: uname -m -n -o -v

  if which('lolcat'):
    echo Welcome to @($(uname)) | lolcat
  elif which('meow'):
    echo Welcome to @($(uname)) | meow
  else: print(f'Welcome to {$(uname)}')

  cowsay_ext = \
    which('cowsay') \
    or __import__('pathlib').Path('/home/linuxbrew/.linuxbrew/bin/cowsay').exists()

  if cowsay_ext and which('lolcat'):
    echo @(randomquote()) | cowsay --bold @(random_opts()) --random | lolcat
  elif cowsay_ext and which('meow'):
    echo @(randomquote()) | cowsay --bold @(random_opts()) --random | meow
  elif cowsay_ext:
    echo @(randomquote()) | cowsay --bold @(random_opts()) --random

_postexec()
del _postexec