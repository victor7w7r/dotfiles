if [[ "$OSTYPE" == darwin* && -x "$(commandexist brew)" ]]; then
  lazyload brew brewup brewupcask -- 'eval "$(/usr/local/bin/brew shellenv)"'
elif [[ "$OSTYPE" == linux* && -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if commandexist carapace; then
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
  source <(carapace _carapace)
fi

which pyenv-virtualenv-init >/dev/null && eval "$(pyenv virtualenv-init -)"

commandexist jump && lazyload jump -- 'eval "$(jump shell)"'
commandexist direnv && lazyload direnv -- 'eval "$(direnv hook zsh)"'
commandexist mise && lazyload mise -- 'eval "(mise activate zsh)'
commandexist systemctl && lazyload systemctl -- 'systemctl --user import-environment PATH'
commandexist fzf && lazyload fzf -- 'source <(fzf --zsh)'
commandexist zoxide && lazyload zoxide -- 'eval "$(zoxide init zsh --cmd cd)"'
commandexist thefuck && lazyload thefuck -- 'eval $(thefuck --alias)'
commandexist pyenv && lazyload pyenv -- 'eval $(pyenv init --path)'
commandexist gh && gh extension list | grep -q 'copilot' && eval "$(gh copilot alias -- zsh)"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[[ -n "$MSYSTEM" ]] && commandexist starship && eval "$(starship init zsh)"
