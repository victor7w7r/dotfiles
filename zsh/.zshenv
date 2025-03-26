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
export ABBR_GET_AVAILABLE_ABBREVIATION=1
export ABBR_LOG_AVAILABLE_ABBREVIATION=1

export FZF_DEFAULT_OPTS='--height 30% --info=inline
    --color fg:223,bg:235,hl:208,fg+:223,bg+:235,gutter:235,hl+:167,border:237
    --color info:241,prompt:214,pointer:214,marker:167,spinner:241,header:214'

export FZF_DEFAULT_COMMAND='fd -tf -HL 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd -td -HLI 2> /dev/null'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=30%
export FZF_COMPLETION_TRIGGER='**'
export FZF_CTRL_T_OPTS='--no-reverse'
export FZF_CTRL_R_OPTS='--no-reverse'
export FZF_ALT_C_OPTS='--no-reverse'
export FZF_COMPLETION_OPTS='--no-reverse'

export LESS="\
  --ignore-case \
  --tilde \
  --chop-long-lines \
  --status-column \
  --LONG-PROMPT \
  --jump-target=10 \
  --RAW-CONTROL-CHARS \
  --clear-screen \
  --tabs=4 \
  --shift=5"
export LESSHISTFILE='-'
export LESSKEYRC="$HOME/.config/less/lesskey"
export LESSKEY="$LESSKEYRC.lwc"
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_se=$'\e[27;0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[24;0m'
export LESS_TERMCAP_us=$'\e[4;1;38;5;250m'

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

command -v exa &>/dev/null && export EZA_COLORS="di=33:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
command -v vivid &>/dev/null && export LS_COLORS=$(vivid generate catppuccin-mocha)
command -v fzf &>/dev/null && export FILTER="fzf"
command -v carapace &>/dev/null && export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
command -v vivid &>/dev/null && export LS_COLORS=$(vivid generate catppuccin-mocha)

if command -v brew &>/dev/null; then
  export HOMEBREW_CASK_OPTS="--no-quarantine"
  export HOMEBREW_NO_ENV_HINTS=true
  export HOMEBREW_NO_AUTO_UPDATE=1
  export HOMEBREW_NO_INSTALL_UPGRADE=1
fi

if [[ "$TERM_PROGRAM" == "zed" ]]; then
  export EDITOR="zed"
  export VISUAL="zed --wait"
fi

if command -v bat &>/dev/null; then
  export BAT_THEME="ansi"
  export BAT_PAGER=""
  export PAGER="bat --plain"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi

if command -v starship &>/dev/null; then
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
  export STARSHIP_CACHE="$HOME/.starship/cache"
fi

if [[ "$OSTYPE" == "darwin"*  ]] || [[ "$OSTYPE" == "freebsd"* ]]; then
  export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
  export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
  export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
  export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
  export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
  export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}
fi

if command -v fnm &>/dev/null; then
  export FNM_VERSION_FILE_STRATEGY="local"
  export FNM_LOGLEVEL="info"
  export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
  export FNM_COREPACK_ENABLED="false"
  export FNM_RESOLVE_ENGINES="true"
fi

if command -v nvim &>/dev/null; then
  export VISUAL="nvim"
  export EDITOR="nvim"
fi
