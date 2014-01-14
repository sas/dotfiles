_ssh_keys_root="$HOME/Documents/keys/ssh"

sa()  { [ $# -eq 1 ] || return 1; ssh-add -t 45m $_ssh_keys_root/"$1".priv; }
sau() { [ $# -eq 1 ] || return 1; ssh-add $_ssh_keys_root/"$1".priv; }
sad() { [ $# -eq 1 ] || return 1; ssh-add -d $_ssh_keys_root/"$1".pub; }
sal() { [ $# -eq 0 ] || return 1; ssh-add -l; }

ssht()  { ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"; }
sshtr() { ssht -l root "$@"; }
sshi()  { ssh -T "$@" /bin/sh -i; }

start_ssh_agent()
{
  test_ssh_agent () { [ -S "$SSH_AUTH_SOCK" ] && [ -O "$SSH_AUTH_SOCK" ]; }
  agent_cache_path="/tmp/$(id -un)-ssh-auth-sock"

  # if we already have a connection to an agent, just exit
  test_ssh_agent && return

  # try to connect to an agent that we already started
  if [ -f "$agent_cache_path" ]; then
    source "$agent_cache_path"
    # check that we didn't source stale/invalid information
    test_ssh_agent && return
  fi

  # if we reached this point, start ssh-agent
  eval $(ssh-agent)
  echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >|"$agent_cache_path"
}

start_ssh_agent
