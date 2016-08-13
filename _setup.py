#!/usr/bin/env python

import os
import shutil
import sys

homedir = os.environ["HOME"]
confdir = os.path.realpath(os.path.dirname(sys.argv[0]))

links = {
    ".bash_login":          "bash/main.sh",
    ".bashrc":              "bash/main.sh",
    ".dir_colors":          "coreutils/dircolors-solarized/dircolors.256dark",
    ".gitconfig":           "git/config",
    ".gitignore":           "git/ignore",
    ".hgrc":                "hg/config",
    ".i3":                  "i3",
    ".i3status.conf":       "i3/status",
    ".lldbinit":            "lldb/lldbinit",
    ".ssh/authorized_keys": "ssh/authorized_keys",
    ".ssh/config":          "ssh/config",
    ".ssh/known_hosts":     "ssh/known_hosts",
    ".vim/bundle/vundle":   "vim/vundle",
    ".vimrc":               "vim/vimrc",
    ".xinitrc":             "xorg/xinitrc",
}

def _delete_path(path):
    for f in [ os.unlink, shutil.rmtree ]:
        try:
            f(path)
            return
        except OSError:
            continue

def _conf_path(path):
    if path[0] == '/':
        return path
    else:
        return os.path.join(confdir, path)

def _home_path(path):
    return os.path.join(homedir, path)

def links_create(force):
    for f in links:
        dst = _home_path(f)
        src = _conf_path(links[f])

        if os.access(dst, os.F_OK):
            if not force:
                print("skipping %s" % dst)
                continue
            else:
                print("removing %s" % dst)
                _delete_path(dst)

        print("linking  %s -> %s" % (dst, src))
        if not os.path.exists(os.path.dirname(dst)):
            os.makedirs(os.path.dirname(dst))
        os.symlink(src, dst)

def links_remove():
    for f in links:
        path = _home_path(f)
        print("removing %s" % path)
        _delete_path(_home_path(path))

def links_show():
    for f in links:
        path = _home_path(f)
        print("%s" % path)

def dump_help():
    global cmd_map
    for e in cmd_map:
        print(e)

cmd_map = {
    "links-create":         lambda: links_create(False),
    "links-create-force":   lambda: links_create(True),
    "links-remove":         links_remove,
    "links-show":           links_show,
    "help":                 dump_help,
}

if __name__ == "__main__":
    if len(sys.argv) == 1:
        command = "links-create"
    else:
        command = sys.argv[1]
    cmd_map[command]()
