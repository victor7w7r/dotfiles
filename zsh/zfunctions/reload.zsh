reload () {
	ZDOTDIR=${ZDOTDIR:-$HOME}
	. "$ZDOTDIR/.zshrc"

	echo "Sourced $ZDOTDIR/.zshrc"
}