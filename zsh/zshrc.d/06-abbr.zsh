setup_abbr() {
  abbr c="clear"
  abbr :q="exit"
  abbr :wq="exit"

  abbr -="cd -"
  abbr ~="cd ~"
  abbr ..="cd .."
  abbr ...="cd ../.."
  abbr ....="cd ../../.."
  abbr .....="cd ../../../.."

  abbr tree="ll --tree --level=2"
  abbr t2="ll --tree --level=2"
  abbr t2a="ll --tree --level=2 -a"

  abbr mux="tmuxinator"
  abbr ms="tmuxinator start"
  abbr msa="tmuxinator start mac-bootstrap"
  abbr msb="tmuxinator start bible_first_online"
  abbr msc="tmuxinator start bf_curriculum"
  abbr msd="tmuxinator start dot"
  abbr msl="tmuxinator start laptop"
  abbr msm="tmuxinator start mux"
  abbr msn="tmuxinator start obsidian"
  abbr mso="tmuxinator start ofreport"

  abbr 664="chmod 664"
  abbr 775="chmod 775"

  abbr tt="tmux attach || tmux new-session -s main"
  abbr ta="tmux attach -t"
  abbr tn="tmux new -s"
  abbr tl="tmux ls"
  abbr tk="tmux kill-session -t"

  abbr dud="du -d 1 -h"
  abbr duf="du -sh *"

  abbr cpv="rsync -a --no-o --no-g -h --info=progress2 -P"
  abbr cpvr="rsync -a --no-o --no-g -h --info=progress2 --append"
  abbr clearf="cat /dev/null >"
  abbr clrf="cat /dev/null >"

  abbr apti="sudo apt install -y"
  abbr aptu="sudo apt update -y"
  abbr aptr="sudo apt remove -y"
  abbr aptf="sudo apt full-upgrade -y"
  abbr aptl="sudo apt list --upgradable"
  abbr di="sudo dpkg -i"
}

#setup_abbr