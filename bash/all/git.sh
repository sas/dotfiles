__git_run_subdir()
{
  if [ -n "$1" ]; then
    target="$1"
  else
    target="."
  fi
  cd "$target" || return 1
  shift

  "$@"
  res=$?

  cd "$OLDPWD"

  return $res
}

__git_is_repo()
{
  [ $# -le 1 ] || return 1
  __git_run_subdir "$1" git rev-parse --git-dir >/dev/null 2>&1
}

__git_current_branch()
{
  [ $# -le 1 ] || return 1
  __git_is_repo "$1" || return 1
  __git_run_subdir "$1" git branch | grep '^*' | awk '{ print $2 }' | tr -d '()'
}

__git_ps1_callback()
{
  __git_is_repo . || return
  echo " ($(__git_current_branch .))"
}

alias gg='git grep -n'
