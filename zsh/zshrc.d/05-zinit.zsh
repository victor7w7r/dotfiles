[[ ! -d "${ZSH_CACHE_DIR}/completions" ]] && mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi lucid for as"command" from"gh-r" \
  if'is-notcygwin' atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  if'is-notcygwin' atpull"%atclone" src"init.zsh" starship/starship \
  atinit"
    ZSH_TMUX_FIXTERM=false
    ZSH_TMUX_AUTOSTART=false
    ZSH_TMUX_AUTOCONNECT=false" \
  OMZP::tmux \
  atinit"HIST_STAMPS=dd.mm.yyyy" OMZL::history.zsh \
  olets/zsh-abbr \
  qoomon/zsh-lazyload \
  vkolagotla/zsh-random-quotes \
  fundor333/bofh \
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
  if'is-notcygwin' OMZP::brew \
  OMZP::bun \
  OMZP::colored-man-pages \
  OMZP::command-not-found \
  if'is-linux' OMZP::debian \
  has'docker' OMZP::docker \
  has'docker' OMZP::docker-compose \
  if'is-linux' OMZP::fbterm \
  has'podman' OMZP::podman \
  OMZP::dotenv \
  has'eza' OMZP::eza \
  OMZP::extract \
  OMZP::fnm \
  OMZP::fzf \
  OMZP::git \
  OMZP::git-commit \
  has'go' OMZP::golang \
  OMZP::gradle \
  OMZP::lol \
  OMZP::man \
  OMZP::python \
  OMZP::react-native \
  OMZP::rsync \
  OMZP::ssh \
  if'is-linux' OMZP::systemd \
  has'tailscale' OMZP::tailscale \
  has'thefuck' OMZP::thefuck \
  OMZP::tldr \
  OMZP::vscode \
  if'is-linux' OMZP::wakeonlan \
  OMZP::web-search \
  OMZP::zoxide \
  OMZP::zsh-interactive-cd \
  jeffreytse/zsh-vi-mode \
  Bhupesh-V/ugit \
  if'is-macos' zshzoo/macos \
  lainiwa/ph-marks \
  Tarrasch/zsh-bd \
  peterhurford/git-it-on.zsh \
  Schroefdop/git-branches \
  hlissner/zsh-autopair \
  unixorn/git-extra-commands \
  rummik/zsh-tailf \
  Yash-Singh1/zsh-plugin-speedtest \
  zchee/zsh-completions \
  if'is-macos' Amar1729/yabai-zsh-completions \
  if'is-linux' greymd/docker-zsh-completion \
  if'is-linux' Doc0x1/Aircrack-Zsh-Completions \
  depth=1 3v1n0/zsh-bash-completions-fallback \

zinit lucid depth=1 for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

zinit as"completion" wait lucid for \
  has'rancher' go/rancher-zsh-completion \
  if'is-macos' benclark/parallels-zsh-plugin \
  if'is-linux' has'msfvenom' Green-m/msfvenom-zsh-completion \
  if'is-linux' has'efibootmgr' wehlando/efibootmgr-zsh-completion

#OMZP::pyenv \
#alesr/oh-my-zsh-haiku-plugin #NEEDS OPENAPI
#tom-doerr/zsh_codex (wait) #REQUIRES PYTHON AND OPENAI
#Licheam/zsh-ask (wait) #NEEDS OPENAPI
#zpm-zsh/clipboard (wait)
#ytakahashi/igit (wait)