alias ls='ls -G'
if command -v gvim >/dev/null 2>&1 && [ -z "$SSH_CONNECTION" ]; then
  alias vim='mvim --remote-tab-silent'
fi
