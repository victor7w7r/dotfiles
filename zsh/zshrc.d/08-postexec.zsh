set -o PROMPT_SUBST
RPS1='$(mommy -c ${ZDOTDIR}/bin/mommy -1 -s $?)'
