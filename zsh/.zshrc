[[ -e "${ZDOTDIR}/.zstyles" ]] && source "${ZDOTDIR}/.zstyles"
[[ -f "${ZDOTDIR}/lib/.private" ]] && source "${ZDOTDIR}/lib/.private"
for zlib in ${ZDOTDIR}/lib/*.zsh; do source $zlib; done; unset zlib
for zfunction in ${ZDOTDIR}/zfunctions/*.zsh; do source $zfunction; done; unset zfunction
for conf in ${ZDOTDIR}/zshrc.d/*.zsh(N); do source $conf; done; unset conf

RPS1="$(mommy -1 -s $?)"
