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
alias killn='killall -q'
alias beep='echo -e "\a"; sleep 0.1; echo -e "\a"'

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
alias path='echo $PATH | tr ":" "\n" | nl'

commandexist tmux && alias tmux='tmux -f ~/.config/tmux/tmux.conf'
commandexist tmux && alias treload='tmux source-file ~/.config/tmux/tmux.conf && tmux display-message "TMUX Config Reloaded"'
commandexist rrr && alias rrr="ranger"
commandexist nnn && alias nnn="nnn -e"
commandexist fastfetch && alias ff="fastfetch -c $HOME/.config/fastfetch/config.conf"
commandexist htop && alias top='htop'
commandexist btm && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'
commandexist flatpak && alias flatupdate="flatpak update; flatpak remove --unused"

if commandexist bat; then
  alias cat="bat -P --paging=never"
  alias b="bat -P --paging=never"
fi

if commandexist brew; then
  alias update='\
    brew -v update ; \
    brew upgrade ; \
    brew upgrade --cask --greedy --verbose ; \
    brew upgrade --force-bottle ; \
    brew cleanup ; \
    brew doctor \
  '
  alias brewinfo="brew leaves | xargs brew desc --eval-all"
elif [[ "$EUID" -ne 0 ]] && commandexist yay; then
  alias update=sh -c "
    set -e
    yay -Syyu --answerupgrade None --answerclean All --answerdiff None
    sudo pacman -Rscn $(pacman -Qdqtt) 2>/dev/null
    yay -Scc --noconfirm
  "
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
elif [[ -n "$MSYSTEM" ]]; then
  alias oso=onesixtyone
  alias cme=crackmapexec
fi

alias reload='. "$ZDOTDIR/.zshrc" && echo "Sourced $ZDOTDIR/.zshrc"'
alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'
alias zupdate='zinit update --parallel 40'
alias zselfupdate='zinit self-update'
alias zreset='rm -rf "${ZSHEXECDIR}/zinit" &>/dev/null && rm -rf "${HOME}/.local/share/zinit" &>/dev/null'