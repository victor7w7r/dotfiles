def _env():
  from shutil import which
  from sys import platform
  from os import getuid
  from re import match

  home = __xonsh__.env['HOME']
  ssh_tty = __xonsh__.env.get('SSH_TTY')
  tty = match(r"^/dev/tty[0-9]+", $(tty).strip())

  if which('starship'):
    $STARSHIP_CACHE=f'{home}/.cache/starship'

    if not tty or platform == 'darwin' or ssh_tty is not None:
      if getuid() == 0: $STARSHIP_CONFIG = f'{home}/.config/starship-root.toml'
      elif getuid() != 0: $STARSHIP_CONFIG = f'{home}/.config/starship.toml'
    elif tty and not platform == 'darwin':
      if getuid() == 0: $STARSHIP_CONFIG = f'{home}/.config/starship-tty-root.toml'
      elif getuid() != 0: $STARSHIP_CONFIG = f'{home}/.config/starship-tty.toml'

  if which('eza'): $EZA_COLORS='di=33:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
  if which('vivid'): $LS_COLORS=$(vivid generate catppuccin-mocha)
  if which('fzf'): $FILTER='fzf'
  if which('carapace'): $CARAPACE_BRIDGES='sh,bash,xonsh,inshellisense'

  if __xonsh__.env.get('TERM_PROGRAM') == 'zed':
    $EDITOR='zed'
    $VISUAL='zed --wait'

  if which('bat'):
    $BAT_THEME='ansi'
    $BAT_PAGER=''
    $PAGER='bat --plain'
    $MANPAGER='sh -c "col -bx | bat -l man -p"'
    $MANROFFOPT='-c'

  if which('fnm'):
    $FNM_VERSION_FILE_STRATEGY='local'
    $FNM_LOGLEVEL='info'
    $FNM_NODE_DIST_MIRROR='https://nodejs.org/dist'
    $FNM_COREPACK_ENABLED='false'
    $FNM_RESOLVE_ENGINES='true'

  if which('brew'):
    $HOMEBREW_CASK_OPTS='--no-quarantine'
    $HOMEBREW_NO_ENV_HINTS='true'
    $HOMEBREW_NO_AUTO_UPDATE=1
    $HOMEBREW_NO_INSTALL_UPGRADE=1

  $XDG_CONFIG_HOME=f'{home}/.config'
  $XDG_CACHE_HOME=f'{home}/.cache'
  $XDG_DATA_HOME=f'{home}/.local/share'
  $XDG_STATE_HOME=f'{home}/.local/state'
  $XDG_DATA_DIRS=f'/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:{home}/.local/share/flatpak/exports/share'
  $XDG_CONFIG_DIRS='/etc/xdg'

  $FZF_DEFAULT_OPTS='\
    --height 30% --info=inline\
    --color fg:223,bg:235,hl:208,fg+:223,bg+:235,gutter:235,hl+:167,border:237\
    --color info:241,prompt:214,pointer:214,marker:167,spinner:241,header:214'
  $FZF_DEFAULT_COMMAND='fd -tf -HL 2> /dev/null'
  $FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
  $FZF_ALT_C_COMMAND='fd -td -HLI 2> /dev/null'
  $FZF_TMUX=1
  $FZF_TMUX_HEIGHT='30%'
  $FZF_COMPLETION_TRIGGER='**'
  $FZF_CTRL_T_OPTS='--no-reverse'
  $FZF_CTRL_R_OPTS='--no-reverse'
  $FZF_ALT_C_OPTS='--no-reverse'
  $FZF_COMPLETION_OPTS='--no-reverse'

  $LESS='\
    --ignore-case \
    --tilde \
    --chop-long-lines \
    --status-column \
    --LONG-PROMPT \
    --jump-target=10 \
    --RAW-CONTROL-CHARS \
    --clear-screen \
    --tabs=4 \
    --shift=5'
  $LESSHISTFILE='-'
  $LESSKEYRC=f'{home}/.config/less/lesskey'
  $LESSKEY='$LESSKEYRC.lwc'
  $LESS_TERMCAP_md='\x1b[01;34m'
  $LESS_TERMCAP_me='\x1b[0m'
  $LESS_TERMCAP_mh='\x1b[2m'
  $LESS_TERMCAP_mr='\x1b[7m'
  $LESS_TERMCAP_se='\x1b[27;0m'
  $LESS_TERMCAP_so='\x1b[1;33m'
  $LESS_TERMCAP_ue='\x1b[24;0m'
  $LESS_TERMCAP_us='\x1b[4;1;38;5;250m'

_env()
del _env