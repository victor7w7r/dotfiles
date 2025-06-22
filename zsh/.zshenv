echo -ne '\e[5 q'

export ZSH="${HOME}/.zsh"
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
export ZFUNCDIR="${ZDOTDIR}/zfunctions"
export HISTFILE="${ZSH}/.history"
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTORY_IGNORE="(ls|cd|cd -|pwd|exit|date|* --help)"
export ZSH_COMPDUMP="${ZSH}/.zcompdump"
export ZSH_CACHE_DIR="${ZSH}/cache"
export PLUGINS_DIR="${ZDOTDIR}/plugins"
export ZINIT_HOME="${ZSH}/zinit/zinit.git"
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export GPG_TTY=$(tty)
export COLORTERM="truecolor"
export SHELL="zsh"
export ZSHRCD="${ZDOTDIR}/zshrc.d"
export TERMINAL="wezterm"
export PYENV_ROOT="${HOME}/.pyenv"

typeset -gU path fpath

path=(
  /bin
  /usr/bin
  $HOME/.local/{,s}bin(N)
  $HOME/{,s}bin(N)
  /usr/local/{,s}bin(N)
  node_modules/.bin
  $PYENV_ROOT/bin
  $ZFUNCDIR
  $path
)
fpath=("$ZSH/functions" "$ZSH/completions" $fpath)

unset SSH_ASKPASS
unset PROMPT_FIRST_TIME

if [[ -o login && \
  "$(tty)" =~ /dev/tty[0-9]+ && \
  "$OSTYPE" != darwin* && \
  -z "$FBTERM_SESSION_ID" && \
  -x "$(command -v fbterm)" ]]
then
  exec fbterm -- /bin/zsh -l -c 'export TERM=fbterm'
fi

if [[ -o interactive && \
  -z "$TMUX" && \
  -x "$(command -v tmux)" && \
  "$TERM_PROGRAM" != "vscode" && \
  -z "$SSH_TTY" ]]
then
  exec tmux -f "$HOME/.config/tmux/tmux.conf"
fi