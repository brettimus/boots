#!/usr/bin/env sh

set -eu

plugin_root="${HOME}/.tmux/plugins"

install_plugin() {
  name="$1"
  url="$2"
  destination="${plugin_root}/${name}"

  if [ -d "${destination}/.git" ]; then
    printf '%s already installed at %s\n' "${name}" "${destination}"
    return
  fi

  if [ -e "${destination}" ]; then
    printf 'cannot install %s: %s exists but is not a git checkout\n' \
      "${name}" "${destination}" >&2
    return 1
  fi

  git clone --depth 1 "${url}" "${destination}"
}

command -v git >/dev/null 2>&1 || {
  printf 'git is required to install tmux plugins\n' >&2
  exit 1
}

mkdir -p "${plugin_root}"
install_plugin tmux-resurrect https://github.com/tmux-plugins/tmux-resurrect.git
install_plugin tmux-continuum https://github.com/tmux-plugins/tmux-continuum.git

printf 'tmux plugins are ready; reload with: tmux source-file "$HOME/.tmux.conf"\n'
