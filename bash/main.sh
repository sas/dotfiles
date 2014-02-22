export FULLNAME="Stephane Sezer"
export EMAIL="sas@cd80.net"
export EDITOR="vim"
export PAGER="vimpager"

RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

export PS1="$FRED[$RS$FGRN\u@\h$RS $FBLE\w$RS$FYEL\$(__git_ps1_callback)$RS$FRED]$RS "

shopt -u interactive_comments
shopt -s nullglob
set -o noclobber

for d in all by-system/$(uname -s) by-nodename/$(uname -n); do
  for f in ~/Source/dotfiles/bash/$d/*.sh; do
    source $f
  done
done
