#set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
#fortune -s | cowsay -f $toon | lolcat

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
