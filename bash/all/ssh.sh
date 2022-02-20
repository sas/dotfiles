ssht()  { ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"; }
sshtr() { ssht -l root "$@"; }
sshi()  { ssh -T "$@" /bin/sh -i; }
