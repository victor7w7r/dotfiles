for zfunction in ${ZDOTDIR}/zfunctions/*.zsh; do source $zfunction; done; unset zfunction
[[ -f "${ZDOTDIR}/.private" ]] && source "${ZDOTDIR}/.private"
[[ -e "${ZDOTDIR}/.zstyles" ]] && source "${ZDOTDIR}/.zstyles"
for conf in ${ZDOTDIR}/zshrc.d/*.zsh(N); do source $conf; done; unset conf
