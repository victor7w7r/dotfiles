zi lucid for as"command" from"gh-r" \
  atinit"
    ZSH_TMUX_FIXTERM=false
    ZSH_TMUX_AUTOSTART=false
    ZSH_TMUX_AUTOCONNECT=false" \
  OMZP::tmux \
  atinit"
    HIST_STAMPS=dd.mm.yyyy
    HISTFILE='$HOME/.zsh/.history'
    HISTSIZE=55000
    SAVEHIST=15000" \
  OMZL::history.zsh \
  olets/zsh-abbr \
  qoomon/zsh-lazyload \
  Aloxaf/fzf-tab \
  jirutka/zsh-shift-select

zi wait lucid for as"program" pick"bin/git-fuzzy" bigH/git-fuzzy

zi wait lucid for \
  OMZL::clipboard.zsh \
  OMZL::compfix.zsh \
  OMZL::completion.zsh \
  OMZL::correction.zsh \
  OMZL::directories.zsh \
  OMZL::git.zsh \
  OMZL::grep.zsh \
  OMZL::key-bindings.zsh \
  OMZL::spectrum.zsh \
  OMZP::aliases \
  OMZP::alias-finder \
  if'is-linux' OMZP::archlinux \
  has'autojump' OMZP::autojump \
  has'bgnotify' OMZP::bgnotify \
  OMZP::bun \
  OMZP::colored-man-pages \
  OMZP::command-not-found \
  has'podman' OMZP::podman \
  has'eza' OMZP::eza \
  OMZP::extract \
  OMZP::fnm \
  OMZP::fzf \
  OMZP::git \
  OMZP::git-commit \
  OMZP::lol \
  OMZP::python \
  OMZP::rsync \
  OMZP::rust \
  OMZP::ssh \
  if'is-linux' OMZP::systemd \
  has'tailscale' OMZP::tailscale \
  has'thefuck' OMZP::thefuck \
  has'cod' dim-an/cod \
  OMZP::tldr \
  OMZP::vscode \
  if'is-linux' OMZP::wakeonlan \
  OMZP::web-search \
  OMZP::zoxide \
  OMZP::zsh-interactive-cd \
  if'is-notcygwin' jeffreytse/zsh-vi-mode \
  Bhupesh-V/ugit \
  lainiwa/ph-marks \
  if'is-notcygwin' Tarrasch/zsh-bd \
  Schroefdop/git-branches \
  hlissner/zsh-autopair \
  unixorn/git-extra-commands \
  wfxr/forgit \
  joshskidmore/zsh-fzf-history-search \
  depth=1 3v1n0/zsh-bash-completions-fallback

zinit lucid depth=1 for \
  atinit"
    ZINIT[COMPINIT_OPTS]=-C
    ZINIT[ZCOMPDUMP_PATH]="$ZSHEXECDIR/zcompdump"
    zpcompinit
    zpcdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
  zsh-users/zsh-completions

zinit as"completion" wait lucid for \
  has'rancher' go/rancher-zsh-completion \
  if'is-linux' has'msfvenom' Green-m/msfvenom-zsh-completion \
  if'is-linux' has'efibootmgr' wehlando/efibootmgr-zsh-completion

if commandexist carapace; then
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
  source <(carapace _carapace)
fi

if [ -e /etc/profile.d/nix.sh ]; then
  . /etc/profile.d/nix.sh
fi

commandexist jump && lazyload jump -- 'eval "$(jump shell)"'
commandexist direnv && lazyload direnv -- 'eval "$(direnv hook zsh)"'
commandexist cod && source <(cod init $$ zsh)
commandexist mise && lazyload mise -- 'eval "(mise activate zsh)'
commandexist systemctl && lazyload systemctl -- 'systemctl --user import-environment PATH'
commandexist fzf && lazyload fzf -- 'source <(fzf --zsh)'
commandexist zoxide && lazyload zoxide -- 'eval "$(zoxide init zsh --cmd cd)"'
commandexist thefuck && lazyload thefuck -- 'eval $(thefuck --alias)'
commandexist pyenv && lazyload pyenv -- 'eval $(pyenv init --path)'
commandexist gh && gh extension list | grep -q 'copilot' && eval "$(gh copilot alias -- zsh)"
commandexist starship && eval "$(starship init zsh)"
which pyenv-virtualenv-init >/dev/null && eval "$(pyenv virtualenv-init -)"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#OMZP::pyenv \
#alesr/oh-my-zsh-haiku-plugin #NEEDS OPENAPI
#tom-doerr/zsh_codex (wait) #REQUIRES PYTHON AND OPENAI
#Licheam/zsh-ask (wait) #NEEDS OPENAPI
#zpm-zsh/clipboard (wait)
#ytakahashi/igit (wait)
