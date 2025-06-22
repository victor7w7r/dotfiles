if [[ "$OSTYPE" == darwin* && -x "$(command -v brew)" ]]; then
  lazyload brew brewup brewupcask -- 'eval "$(/usr/local/bin/brew shellenv)"'
elif [[ "$OSTYPE" == linux* && -d "/home/linuxbrew/.linuxbrew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

commandexist systemctl && lazyload systemctl -- 'systemctl --user import-environment PATH'
commandexist fzf && lazyload fzf -- 'source <(fzf --zsh)'
commandexist thefuck && lazyload thefuck -- 'eval $(thefuck --alias)'
commandexist pyenv && lazyload pyenv -- 'eval $(pyenv init --path)'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

if command -v gh >/dev/null && gh extension list | grep -q 'copilot'; then
  eval "$(gh copilot alias -- zsh)"
fi

if commandexist carapace; then
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
  source <(carapace _carapace)
fi

#source <(cod init $$ bash)

#if type -q direnv
#  direnv hook fish | source
#end

#if type -q mise
#  mise activate fish | source
#end

#atuin init fish --disable-up-arrow | source
