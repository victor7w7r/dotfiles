import os

_prepends = [
  '/bin',
  '/sbin',
  '/usr/bin',
  '/usr/local/bin',
  '/usr/sbin',
  'node_modules/.bin',
  f"{__xonsh__.env['HOME']}/bin",
  f"{__xonsh__.env['HOME']}/.local/bin",
]

for prepend in _prepends:
  if os.path.isdir(prepend) and prepend not in $PATH:
    $PATH.insert(0, prepend)
del _prepends
