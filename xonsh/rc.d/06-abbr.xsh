def _abbr():
  abbrevs['c'] = 'clear'
  abbrevs[':q'] = 'exit'
  abbrevs[':wq'] = 'exit'
  abbrevs['-'] = 'cd -'
  abbrevs['~'] = 'cd ~'
  abbrevs['tree'] = 'll --tree --level=2'
  abbrevs['t2'] = 'll --tree --level=2'
  abbrevs['t2a'] = 'll --tree --level=2 -a'

  abbrevs['mux'] = 'tmuxinator'
  abbrevs['ms'] = 'tmuxinator start'
  abbrevs['msa'] = 'tmuxinator start mac-bootstrap'
  abbrevs['msb'] = 'tmuxinator start bible_first_online'
  abbrevs['msc'] = 'tmuxinator start bf_curriculum'
  abbrevs['msd'] = 'tmuxinator start dot'
  abbrevs['msl'] = 'tmuxinator start laptop'
  abbrevs['msm'] = 'tmuxinator start mux'
  abbrevs['msn'] = 'tmuxinator start obsidian'
  abbrevs['mso'] = 'tmuxinator start ofreport'

  abbrevs['664'] = 'chmod 664'
  abbrevs['775'] = 'chmod 775'

  abbrevs['tt'] = 'tmux attach || tmux new-session -s main'
  abbrevs['ta'] = 'tmux attach -t'
  abbrevs['tn'] = 'tmux new -s'
  abbrevs['tl'] = 'tmux ls'
  abbrevs['tk'] = 'tmux kill-session -t'

  abbrevs['dud'] = 'du -d 1 -h'
  abbrevs['duf'] = 'du -sh *'

  abbrevs['cpv'] = 'rsync -a --no-o --no-g -h --info=progress2 -P'
  abbrevs['cpvr'] = 'rsync -a --no-o --no-g -h --info=progress2 --append'
  abbrevs['clearf'] = 'cat /dev/null >'
  abbrevs['clrf'] = 'cat /dev/null >'

  abbrevs['apti'] = 'sudo apt install -y'
  abbrevs['aptu'] = 'sudo apt update -y'
  abbrevs['aptr'] = 'sudo apt remove -y'
  abbrevs['aptf'] = 'sudo apt full-upgrade -y'
  abbrevs['aptl'] = 'sudo apt list --upgradable'
  abbrevs['di'] = 'sudo dpkg -i'

_abbr()
del _abbr