if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader})
fortune -s | cowsay -f $toon | lolcat
