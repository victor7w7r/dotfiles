# shellcheck disable=SC1091
if [[ ! -d "$BASH_IT" ]]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  cp "${HOME}/.config/bash/bashit-profile" "${BASH_IT}/profiles/victor7w7r.bash_it" &> /dev/null
  rm -rf "${BASH_IT}/custom" &> /dev/null
  rm -rf "${BASH_IT}/docs" &> /dev/null
  rm -rf "${BASH_IT}/template" &> /dev/null
  rm -rf "${BASH_IT}/themes" &> /dev/null
  sh ~/.bash_it/install.sh --no-modify-config --silent

  source "$BASH_IT"/bash_it.sh
  bash-it profile load victor7w7r
else
  source "$BASH_IT"/bash_it.sh
fi

if commandexist carapace; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
  source <(carapace _carapace)
fi

commandexist direnv && eval "$(direnv hook bash)"
commandexist mise && eval "(mise activate bash)" &>/dev/null
commandexist systemctl && eval "$(systemctl --user import-environment PATH)"
commandexist fzf && source <(fzf --bash)
commandexist zoxide && eval "$(zoxide init bash --cmd cd)"
commandexist thefuck && eval "$(thefuck --alias)"
commandexist pyenv && eval "$(pyenv init --path)"
commandexist gh && gh extension list | grep -q 'copilot' && eval "$(gh copilot alias -- bash)"
commandexist starship && eval "$(starship init bash)"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --attach=none