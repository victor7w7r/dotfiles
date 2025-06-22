alias ssh="TERM=xterm-256color command ssh"
alias _="sudo"
alias o="open ."
alias t='btop'
alias ff='find . -type f -name'
alias fd='find . -type d -name'
alias chmox='chmod +x'
alias mv="mv -iv"
alias rm="rm -rvif"
alias cls="clear && printf '\e[3J'"
alias cp="cp -rvi"
alias cdy="pwd | xclip -i"
alias cdp="cd (xclip -o)"
alias cow="customfortunes | cowsay --bold $(random-opts) --random --super"
alias mkdir='mkdir -pv'
alias tarls="tar -tvf"
alias shot='flameshot gui'
alias untar="tar -xf"
alias biggest='du -s ./* | sort -nr | awk '\''{print $2}'\'' | xargs du -sh'
alias dux='du -x --max-depth=1 | sort -n'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias grep="grep -H --color=auto --exclude-dir={.git,.vscode}"
alias rscp="rsync -avhE --progress --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable"
alias rsmv="rsync -avhE --no-compress --progress --remove-source-files --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable"
alias py="python3"
alias g="git"
alias lg="lazygit"
alias lzd="lazydocker"
alias vifish="nvim $HOME/.config/fish/config.fish && source $HOME/.config/fish/config.fish"
alias killn='killall -q'

alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias datestamp="date '+%Y-%m-%d'"
alias isodate="date +%Y-%m-%dT%H:%M:%S%z"
alias utc="date -u +%Y-%m-%dT%H:%M:%SZ"
alias unixepoch="date +%s"

alias meminfo='free -m -l -t'
alias memhog='ps -eo pid,ppid,cmd,%mem --sort=-%mem | head'
alias cpuhog='ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head'
alias cpuinfo='lscpu'
alias distro='cat /etc/*-release'
alias ports='netstat -tulanp'

alias print-fpath='for fp in $fpath; do echo $fp; done; unset fp'
alias print-path='echo $PATH | tr ":" "\n"'
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

alias myip='curl icanhazip.com'
alias weather='curl wttr.in'
alias weather-short='curl "wttr.in?format=3"'
alias cheat='curl cheat.sh/'
alias tinyurl='curl -s "http://tinyurl.com/api-create.php?url='
alias joke='curl https://icanhazdadjoke.com'
alias hackernews='curl hkkr.in'
alias worldinternet='curl https://status.plaintext.sh/t'

commandexist tmux && alias tmux='tmux -f ~/.config/tmux/tmux.conf'
commandexist zoxide && alias cd='z'
commandexist rrr && alias rrr="ranger"
commandexist nnn && alias nnn="nnn -e"
commandexist fastfetch && alias ff="fastfetch -c $HOME/.config/fastfetch/config.conf"

commandexist htop && alias top='htop'
commandexist gotop && alias top='gotop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
commandexist ytop && alias top='ytop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
commandexist btm && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'

if commandexist bat; then
  alias cat="bat -P --paging=never"
  alias b="bat -P --paging=never"
fi

if commandexist brew; then
  alias brewinfo="brew leaves | xargs brew desc --eval-all"
  alias brewup="brew -v update; brew upgrade --force-bottle; brew cleanup; brew doctor"
  alias brewupcask="brew -v update; brew upgrade --cask --greedy --verbose; brew cleanup; brew doctor"
fi

if commandexist eza; then
  alias l="eza --icons --git --classify=auto --color --group-directories-first --sort=extension -a"
  alias ls="l"
  alias ll="l -l --octal-permissions --no-permissions --header --group --created --modified"
  alias lsa="ls -aG"
  alias ldot='ls -ld .*'
fi

if commandexist nvim; then
  alias v="nvim ."
  alias vi="nvim"
  alias nano="nvim"
  alias vim="nvim"
  alias astro="NVIM_APPNAME=AstroNvim nvim"
  alias nv="NVIM_APPNAME=NvChad nvim"
  alias lazy="NVIM_APPNAME=LazyVim nvim"
  alias aa="NVIM_APPNAME=ArchVim nvim"
  alias lunar="lvim"
  alias kick="NVIM_APPNAME=kickstart nvim"
  alias fresh="NVIM_APPNAME=FreshVim nvim"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
  alias masi='mas install'
  alias masl='mas list'
  alias maso='mas outdated'
  alias mass='mas search'
  alias masu='mas upgrade'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias btrfs-snap="sudo btrfs subvolume snapshot / /snapshots/root_(date +'%Y-%m-%d_%H:%M')"
  alias me='echo $(ifconfig eth0 | grep "inet " | cut -b 9- | cut  -d" " -f2)'
  alias e4l="enum4linux -a"
  alias h2t="html2text -style pretty"
  alias s='startx'
  alias oso=onesixtyone
  alias cme=crackmapexec
elif [[ "$OSTYPE" == "cygwin" ]]; then
  alias oso=onesixtyone
  alias cme=crackmapexec
fi
