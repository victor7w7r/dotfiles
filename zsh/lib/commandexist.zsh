function commandexist() {
  command -v $1 &> /dev/null
}
