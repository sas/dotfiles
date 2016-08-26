ssht()  { ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"; }
sshtr() { ssht -l root "$@"; }
sshi()  { ssh -T "$@" /bin/sh -i; }

mkdir -p ~/.ssh/{control,agent}

__start_ssh_agent() {
  local sock_path="$HOME/.ssh/agent/sock"
  local pid_path="$HOME/.ssh/agent/pid"

  if [ -S "${SSH_AUTH_SOCK-}" -a -n "${SSH_AGENT_PID-}" ]; then
    # ssh-agent is already started and configured. Nothing to do.
    return
  fi

  if [ -S "$sock_path" -a -f "$pid_path" ]; then
    export SSH_AUTH_SOCK="$sock_path"
    export SSH_AGENT_PID="$(cat "$pid_path")"
  else
    eval $(ssh-agent -a "$sock_path")
    echo "$SSH_AGENT_PID" >|"$pid_path"
  fi
}

__start_ssh_agent
