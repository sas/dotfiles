__is_source_file() {
  case "$1" in
    *.c|*.h|*.m|*.cpp|*.cc|*.mm|*.js|*.json|*.yml|Makefile) return 0;;
    *) return 1;;
  esac
}

cat() {
  if [ $# -eq 1 ] && [ -t 1 ] && __is_source_file "$1" && which -s vimpager; then
    vimpager "$1"
  else
    "$(which cat)" "$@"
  fi
}
