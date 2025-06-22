[[ -e "${ZDOTDIR}/.zstyles" ]] && source "${ZDOTDIR}/.zstyles"
[[ -f "${ZDOTDIR}/.private" ]] && source "${ZDOTDIR}/.private"
for zfunction in ${ZDOTDIR}/zfunctions/*.zsh; do source $zfunction; done; unset zfunction
for conf in ${ZDOTDIR}/zshrc.d/*.zsh(N); do source $conf; done; unset conf
