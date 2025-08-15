from random import choice

commandexist = lambda cmdres: ![command -v @(cmdres) &>/dev/null].returncode == 0
random_opts = lambda: choice(['-b', '-d', '-g', '-p', '-s', '-t', '-w', '-y'])

def x(*args):
  if len(args) == 1: __xonsh__.env[args[0]] = ''
  elif len(args) >= 2: __xonsh__.env[args[0]] = ' '.join(args[1:])
  else:
    print("Usage: x VARIABLE [VALUE]")
    return 1