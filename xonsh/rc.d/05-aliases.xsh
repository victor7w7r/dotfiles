def _aliases():
  from shutil import which
  from sys import platform

  aliases['ssh'] = 'TERM=xterm-256color command ssh'
  aliases['_'] = 'sudo'
  aliases['o'] = 'open .'
  aliases['t'] = 'btop'
  aliases['ff'] = 'find . -type f -name'
  aliases['fd'] = 'find . -type d -name'
  aliases['chmox'] = 'chmod +x'
  aliases['mv'] = 'mv -iv'
  aliases['rm'] = 'rm -rvif'
  aliases['cls'] = 'clear && printf "\x1b[3J"'
  aliases['cp'] = 'cp -rvi'
  aliases['cow'] = 'customfortunes | cowsay --bold @(random_opts()) --random --super'
  aliases['cdy'] = 'pwd | xclip -i'
  aliases['mkdir'] = 'mkdir -pv'
  aliases['tarls'] = 'tar -tvf'
  aliases['shot'] = 'flameshot gui'
  aliases['untar'] = 'tar -xf'
  aliases['biggest'] = "du -s ./* | sort -nr | awk '{print $2}' | xargs du -sh"
  aliases['dux'] = 'du -x --max-depth=1 | sort -n'
  aliases['dud'] = 'du -d 1 -h'
  aliases['duf'] = 'du -sh *'
  aliases['grep'] = ['grep', '-H', '--color=auto', r'--exclude-dir={.git,.vscode}']
  aliases['rscp'] = 'rsync -avhE --progress --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable'
  aliases['rsmv'] = 'rsync -avhE --no-compress --progress --remove-source-files --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable'
  aliases['py'] = 'python3'
  aliases['g'] = 'git'
  aliases['lg'] = 'lazygit'
  aliases['lzd'] = 'lazydocker'
  aliases['killn'] = 'killall -q'
  aliases['colormap'] = r'for i in {0..255}; do print -Pn "%K{$i} %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$"\n"}; done'
  aliases['beep'] = r'echo -e "\a"; sleep 0.1; echo -e "\a"'

  aliases['timestamp'] = "date '+%Y-%m-%d %H:%M:%S'"
  aliases['datestamp'] = "date '+%Y-%m-%d'"
  aliases['isodate'] = 'date +%Y-%m-%dT%H:%M:%S%z'
  aliases['utc'] = 'date -u +%Y-%m-%dT%H:%M:%SZ'
  aliases['unixepoch'] = 'date +%s'

  aliases['meminfo'] = 'free -m -l -t'
  aliases['memhog'] = 'ps -eo pid,ppid,cmd,%mem --sort=-%mem | head'
  aliases['cpuhog'] = 'ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head'
  aliases['cpuinfo'] = 'lscpu'
  aliases['distro'] = 'cat /etc/*-release'
  aliases['ports'] = 'netstat -tulanp'

  aliases['print-fpath'] = 'for fp in $fpath; do echo $fp; done; unset fp'
  aliases['print-path'] = r'echo $PATH | tr ":" "\n"'
  aliases['print-functions'] = 'print -l ${(k)functions[(I)[^_]*]} | sort'
  aliases['myip'] = 'curl icanhazip.com'
  aliases['weather'] = 'curl wttr.in'
  aliases['weather-short'] = 'curl "wttr.in?format=3"'
  aliases['cheat'] = 'curl cheat.sh/'
  aliases['tinyurl'] = ['curl','-s', 'http://tinyurl.com/api-create.php?url=']
  aliases['joke'] = 'curl https://icanhazdadjoke.com'
  aliases['hackernews'] = 'curl hkkr.in'
  aliases['worldinternet'] = 'curl https://status.plaintext.sh/t'
  aliases['path'] = r'echo $PATH | tr ":" "\n" | nl'

  if which('tmux'):
    aliases['tmux'] = 'tmux -f ~/.config/tmux/tmux.conf'
    aliases['treload'] = 'tmux source-file ~/.config/tmux/tmux.conf && tmux display-message "TMUX Config Reloaded"'

  if which('rrr'): aliases['rrr'] = 'ranger'
  if which('nnn'): aliases['nnn'] = 'nnn -e'
  if which('fastfetch'): aliases['ff'] = ['fastfetch', '-c', '$HOME/.config/fastfetch/config.conf']
  if which('flatpak'): aliases['flatpak'] = 'flatpak update; flatpak remove --unused'
  if which('btop'): aliases['top'] = 'btop'
  elif which('htop'): aliases['top'] = 'htop'

  if which('bat'):
    aliases['cat'] = 'bat -P --paging=never --style=plain'
    aliases['b'] = 'bat -P --paging=never --style=plain'

  aliases['brewup'] = 'brew -v update; brew upgrade; brew cleanup; brew doctor'
  aliases['brewinfo'] = 'brew leaves | xargs brew desc --eval-all'

  if __import__('os').getuid() != 0 and which('yay'):
    aliases['yasu'] = [
      'sh',
      '-c',
      'set -e; yay -Syyu --answerupgrade None --answerclean All --answerdiff None'
      r'sudo pacman -Rscn $(pacman -Qdqtt) 2>/dev/null',
      'yay -Scc --noconfirm'
    ]

  if which('eza'):
    aliases['l'] = 'eza --icons --git --classify=auto --color --group-directories-first --sort=extension -a'
    aliases['ls'] = 'l'
    aliases['ll'] = 'l -l --octal-permissions --no-permissions --header --group --created --modified'
    aliases['lsa'] = 'ls -aG'
    aliases['ldot'] = 'ls -ld .*'

  if which('nvim'):
    aliases['nvim'] = 'nvim'
    aliases['vi'] = 'nvim'
    aliases['nano'] = 'nvim'
    aliases['vim'] = 'nvim'
    aliases['astro'] = 'NVIM_APPNAME=AstroNvim nvim'
    aliases['nv'] = 'NVIM_APPNAME=NvChad nvim'
    aliases['lazy'] = 'NVIM_APPNAME=LazyVim nvim'
    aliases['aa'] = 'NVIM_APPNAME=ArchVim nvim'
    aliases['lunar'] = 'lvim'
    aliases['kick'] = 'NVIM_APPNAME=kickstart nvim'
    aliases['fresh'] = 'NVIM_APPNAME=FreshVim nvim'

  if platform == 'darwin':
    aliases['show'] = 'defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
    aliases['hide'] = 'defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
    aliases['masi'] = 'mas install'
    aliases['masl'] = 'mas list'
    aliases['maso'] = 'mas outdated'
    aliases['mass'] = 'mas search'
    aliases['masu'] = 'mas upgrade'
  elif platform == 'linux':
    aliases['btrfs-snap'] = [
      'sudo', 'btrfs', 'subvolume', 'snapshot', r'/', r"/snapshots/root_(date +'%Y-%m-%d_%H:%M')"
    ]
    aliases['me'] = r'echo $(ifconfig eth0 | grep "inet " | cut -b 9- | cut  -d" " -f2)'
    aliases['e4l'] = 'enum4linux -a'
    aliases['h2t'] = 'html2text -style pretty'
    aliases['s'] = 'startx'
    aliases['oso'] = 'onesixtyone'
    aliases['cme'] = 'crackmapexec'
  elif __xonsh__.env.get('MSYSTEM'):
    aliases['oso'] = 'onesixtyone'
    aliases['cme'] = 'crackmapexec'

_aliases()
del _aliases