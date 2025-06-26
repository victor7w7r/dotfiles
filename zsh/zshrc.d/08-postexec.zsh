if commandexist mommy; then
  set -o PROMPT_SUBST
  RPS1='$(mommy -c ${ZDOTDIR}/lib/mommy.conf -1 -s $?)'
fi
