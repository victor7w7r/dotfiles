if [[ "$OSTYPE" == "darwin"* ]]; then
  if commandexist lolcat; then uname -v | lolcat; else uname -v | lolcat; fi
else
  if commandexist lolcat; then
    uname -m -n -o -v | lolcat
  elif commandexist meow; then
    uname -m -n -o -v | meow
  else
    uname -m -n -o -v
  fi
fi

if commandexist lolcat; then
  echo "Welcome to $(uname)!" | lolcat
elif commandexist meow; then
  echo "Welcome to $(uname)!" | meow
else
  echo "Welcome to $(uname)!"
fi

if commandexist cowsay && commandexist lolcat; then
  random-quote | cowsay --bold $(random-opts) --random | lolcat
elif commandexist cowsay && commandexist meow; then
  random-quote | cowsay --bold $(random-opts) --random | meow
elif commandexist cowsay; then
  random-quote | cowsay --bold $(random-opts) --random
fi

zsh_mommy() {
  if [[
    -o interactive &&
    -z "$TMUX" &&
    -x "$(command -v tmux)" &&
    "$TERM_PROGRAM" != "vscode" &&
    -z "$SSH_TTY" ]]; then
    tmux set-environment -g IS_ZSH "1"
  fi
}

add-zsh-hook precmd zsh_mommy

if commandexist mommy; then
  set -o PROMPT_SUBST
  RPS1='$(mommy -c ${HOME}/.config/tmux/mommy.conf -1 -s $?)'
fi

echo -e '\e[5 q'
