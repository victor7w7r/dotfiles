if [[ "$OSTYPE" == "darwin"* ]]; then
  uname -v | lolcat
else
  uname -m -n -o -v | lolcat
fi

echo "Welcome to $(uname)!" | lolcat

if commandexist fortune && commandexist cowsay; then
  random-quote | cowsay --bold $(random-opts) --random | lolcat
fi

#set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
#fortune -s | cowsay -f $toon | lolcat
