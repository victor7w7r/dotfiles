command -v yay >/dev/null && update() {
  set -e
  yay -Syyu --answerupgrade None --answerclean All --answerdiff None --overwrite="*" flat-remix-gnome
  sudo pacman -Rscn $(pacman -Qdqtt) 2>/dev/null
  yay -Scc --noconfirm
  flatpak update
  flatpak remove --unused
}

command -v apt >/dev/null && update() {
  sudo sh -c "
		set -e
		export DEBIAN_FRONTEND=noninteractive
		dpkg --configure -a
		apt update
		apt -y --fix-broken --fix-missing full-upgrade
		apt -y autoremove --purge
		apt clean
	"
}
