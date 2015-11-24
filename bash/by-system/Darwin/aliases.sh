if which -s gls; then
  alias ls='gls --color --indicator-style=slash --group-directories-first'
  eval "$(gdircolors ~/.dir_colors)"
else
  alias ls='ls -G'
fi

if command -v mvim >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ]; then
  alias vim='mvim --remote-tab-silent'
fi
