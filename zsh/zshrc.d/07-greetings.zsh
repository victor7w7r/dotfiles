#set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
#fortune -s | cowsay -f $toon | lolcat

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v lolcat &>/dev/null; then uname -v | lolcat; else uname -v | lolcat; fi
else
  if command -v lolcat &>/dev/null; then
    uname -m -n -o -v | lolcat
  elif command -v meow &>/dev/null; then
    uname -m -n -o -v | meow
  else
    uname -m -n -o -v
  fi
fi

if command -v lolcat &>/dev/null; then
  echo "Welcome to $(uname)!" | lolcat
elif command -v meow &>/dev/null; then
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
