alias ls='ls --color --indicator-style=slash --group-directories-first'
eval "$(dircolors ~/.dir_colors)"

if command -v gvim >/dev/null 2>&1 && [ -n "$DISPLAY" ]; then
  alias vim='gvim --remote-tab-silent'
fi
