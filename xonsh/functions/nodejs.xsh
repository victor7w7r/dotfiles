def _bp(args): $(bun dev --port @(args))
def _bi(args):
  if len(args) == 0: $(bun i); else: $(bun i @(args))
def _bid(args): $(bun i -D @(args))
def _bg(args): $(bun i -g @(args))
def _be(args): $(bunx @(args))
def _prettierAll(): $(bunx prettier --write .)
def _deleteNodeModules(): $(find . -type d -name node_modules -prune -print | xargs rm -rf)
def _bd(args):
  if len(args) == 0: $(bun dev); else: $(bun @(args))
def _brf():
  _deleteNodeModules()
  $(rm -f bun.lock bun.lockb)
  $(bun i)

aliases['bp'] = _bp
aliases['bi'] = _bi
aliases['bid'] = _bid
aliases['bg'] = _bg
aliases['be'] = _be
aliases['prettierAll'] = _prettierAll
aliases['deleteNodeModules'] = _deleteNodeModules
aliases['bd'] = _bd
aliases['brf'] = _brf