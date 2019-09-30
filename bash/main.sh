shopt -s nullglob
shopt -s checkwinsize
set -o noclobber

for d in utils all by-system/"$(uname -s)" by-nodename/"$(uname -n)"; do
  for f in "$(dirname $(realpath "${BASH_SOURCE[0]}"))/$d"/*.sh; do
    source "$f"
  done
done
