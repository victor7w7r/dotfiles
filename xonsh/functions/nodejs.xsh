
def bp(*args): ![bun dev --port @(args)]
def bi(*args): if len(args) == 0:!bun i else: ![bun i @(args)]
def bid(*args): ![bun i -D @(args)]
def bg(*args): ![bun i -g @(args)]
def be(*args): ![bunx @(args)]
def prettierAll(): !bunx prettier --write .
def deleteNodeModules(): !find . -type d -name node_modules -prune -print | xargs rm -rf
def bd(*args):
  if len(args) == 0: !bun dev else: ![bun @(args)]
def brf():
    deleteNodeModules()
    rm -f bun.lock bun.lockb
    !bun i