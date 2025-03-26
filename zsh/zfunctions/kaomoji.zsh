export em_confused='¯\_(⊙︿⊙)_/¯'
export em_crying='ಥ_ಥ'
export em_cute_bear='ʕ•ᴥ•ʔ'
export em_cute_face='(｡◕‿◕｡)'
export em_excited='☜(⌒▽⌒)☞'
export em_fisticuffs='ლ(｀ー´ლ)'
export em_fliptable='(╯°□°）╯︵ ┻━┻'
export em_person_flip_table=$em_fliptable
export em_person_flip_person='(╯°Д°）╯︵/(.□ . \)\'
export em_table_flip_person='ノ┬─┬ノ ︵ ( \o°o)\'
export em_person_unflip_table='┬──┬◡ﾉ(° -°ﾉ)'
export em_happy='ヽ(´▽`)/'
export em_innocent='ʘ‿ʘ'
export em_kirby='⊂(◉‿◉)つ'
export em_lennyface='( ͡° ͜ʖ ͡°)'
export em_lion='°‿‿°'
export em_muscleflex='ᕙ(⇀‸↼‶)ᕗ'
export em_muscleflex2='ᕦ(∩◡∩)ᕤ'
export em_perky='(`・ω・´)'
export em_piggy='( ́・ω・`)'
export em_shrug='¯\_(ツ)_/¯'
export em_point_right='(☞ﾟヮﾟ)☞'
export em_point_left='☜(ﾟヮﾟ☜)'
export em_magic='╰(•̀ 3 •́)━☆ﾟ.*･｡ﾟ'
export em_shades='(•_•)
( •_•)>⌐■-■
(⌐■_■)'
export em_disapprove='ಠ_ಠ'
export em_wink='ಠ‿↼'
export em_facepalm='(－‸ლ)'
export em_hataz_gon_hate='ᕕ( ᐛ )ᕗ'
export em_salute='(￣^￣)ゞ'

function emoji() {
  case "$1" in
    -h|--help|help)
      printf "\"emoji\" puts various funny expressions in the system clipboard\n\n"
      printf " --hunh for ಠ_ಠ\n\n"
      printf " --shrug -s for ¯\_(ツ)_/¯\n\n"
      printf " --table-flip -tf for (╯°□°）╯︵ ┻━┻\n\n"
      printf " --trolling for ༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽\n\n"
      printf " --yay -y for ✧*｡٩(ˊᗜˋ*)و✧*｡\n\n"
      return 0
      ;;
    --hunh)
      if command -v pbcopy >/dev/null 2>&1; then
        echo -n "ಠ_ಠ" | pbcopy
      elif command -v xsel >/dev/null 2>&1; then
        echo -n "ಠ_ಠ" | xsel --clipboard
      fi
      ;;
    -s|--shrug)
      if command -v pbcopy >/dev/null 2>&1; then
        echo -n "¯\_(ツ)_/¯" | pbcopy
      elif command -v xsel >/dev/null 2>&1; then
        echo -n "¯\_(ツ)_/¯" | xsel --clipboard
      fi
      ;;
    -tf|--table-flip)
      if command -v pbcopy >/dev/null 2>&1; then
        echo -n "(╯°□°）╯︵ ┻━┻" | pbcopy
      elif command -v xsel >/dev/null 2>&1; then
        echo -n "(╯°□°）╯︵ ┻━┻" | xsel --clipboard
      fi
      ;;
    --trolling)
      if command -v pbcopy >/dev/null 2>&1; then
        echo -n "༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽" | pbcopy
      elif command -v xsel >/dev/null 2>&1; then
        echo -n "༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽" | xsel --clipboard
      fi
      ;;
    -y|--yay)
      if command -v pbcopy >/dev/null 2>&1; then
        echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | pbcopy
      elif command -v xsel >/dev/null 2>&1; then
        echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | xsel --clipboard
      fi
      ;;
    *)
      printf "Unknown option: '%s'\n" "$1"
      printf "\n"
      printf " --hunh for ಠ_ಠ\n\n"
      printf " --shrug -s for ¯\_(ツ)_/¯\n\n"
      printf " --table-flip -tf for (╯°□°）╯︵ ┻━┻\n\n"
      printf " --trolling for ༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽\n\n"
      printf " --yay -y for ✧*｡٩(ˊᗜˋ*)و✧*｡\n\n"
      return 1
      ;;
  esac
}
