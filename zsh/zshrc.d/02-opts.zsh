export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR='vim'
export GPG_TTY=$(tty)
export COLORTERM="truecolor"
export SHELL="zsh"
export TERMINAL="rio"
export ABBR_GET_AVAILABLE_ABBREVIATION=1
export ABBR_LOG_AVAILABLE_ABBREVIATION=1
autoload -Uz add-zsh-hook

export ZVM_CURSOR_STYLE_ENABLED=false
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

_fix_cursor() {
  echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

setopt_if_exists extended_glob
setopt_if_exists interactivecomments
setopt_if_exists COMPLETE_IN_WORD
setopt_if_exists ALWAYS_TO_END
setopt_if_exists PATH_DIRS
setopt_if_exists AUTO_MENU
setopt_if_exists AUTO_REMOVE_SLASH
setopt_if_exists AUTO_PARAM_SLASH
setopt_if_exists GLOB_COMPLETE
setopt_if_exists BANG_HIST
setopt_if_exists EXTENDED_HISTORY
setopt_if_exists INC_APPEND_HISTORY
setopt_if_exists SHARE_HISTORY
setopt_if_exists HIST_EXPIRE_DUPS_FIRST
setopt_if_exists HIST_IGNORE_ALL_DUPS
setopt_if_exists HIST_FIND_NO_DUPS
setopt_if_exists HIST_IGNORE_SPACE
setopt_if_exists HIST_SAVE_NO_DUPS
setopt_if_exists HIST_VERIFY
setopt_if_exists HIST_REDUCE_BLANKS
setopt_if_exists APPEND_HISTORY
setopt_if_exists HIST_NO_STORE
setopt_if_exists HIST_NO_FUNCTIONS
setopt_if_exists HIST_REDUCE_BLANKS
setopt_if_exists appendhistory
setopt_if_exists sharehistory
setopt_if_exists incappendhistory
setopt_if_exists AUTO_CD
setopt_if_exists AUTO_PUSHD
setopt_if_exists PUSHD_IGNORE_DUPS
setopt_if_exists PUSHD_SILENT
setopt_if_exists PUSHD_TO_HOME
setopt_if_exists AUTOPARAMSLASH
setopt_if_exists NO_CDABLE_VARS
setopt_if_exists NO_CHASE_DOTS
setopt_if_exists NO_CHASE_LINKS
setopt_if_exists NO_POSIX_CD
setopt_if_exists PUSHD_MINUS
setopt_if_exists COMPLETE_IN_WORD
setopt_if_exists LIST_PACKED
setopt_if_exists MENU_COMPLETE

unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP
unset setopt_if_exists
unset SSH_ASKPASS
unset PROMPT_FIRST_TIME

bindkey '^[[1;2B' down-line-or-history
bindkey '^[[1;2A' up-line-or-history
bindkey '^[[1;2C' forward-word
bindkey '^[[1;2D' backward-word
