[[ -f "${ZDOTDIR}/.private" ]] && source "${ZDOTDIR}/.private"
[[ -e "${ZDOTDIR}/.zstyles" ]] && source "${ZDOTDIR}/.zstyles"
for conf in ${ZDOTDIR}/zshrc.d/*.zsh(N); do source $conf; done; unset conf
