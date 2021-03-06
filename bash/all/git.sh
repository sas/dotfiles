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
  __git_run_subdir "$1" git branch | grep '^*' | sed -e 's,\*[[:space:]]*,,' | tr -d '()'
}

__git_ps1_callback()
{
  __git_is_repo . || return
  echo " ($(__git_current_branch .))"
}

git-merges-cleanly()
{
  [ $# -eq 1 ] || return 1
  __git_is_repo . || return 1
  if [ "$(git rev-parse HEAD)" = "$(git merge-base HEAD "$1")" ]; then
    echo "yes"
    return 0
  else
    echo "no"
    return 1
  fi
}

alias gg='git grep -n'
