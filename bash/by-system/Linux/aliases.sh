alias ls='ls --color --group-directories-first'
if command -v gvim >/dev/null 2>&1 && [ -n "$DISPLAY" ]; then
  alias vim='gvim --remote-tab-silent'
fi
