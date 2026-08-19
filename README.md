# The Setup van Boots

My (backed up) setup for zsh, vim, tmux, and terminal config.

## Quick Start

```bash
# Copy configs to home directory
cp .zshrc.example ~/.zshrc
cp .zprofile.example ~/.zprofile
cp .vimrc.example ~/.vimrc
cp .tmux.conf.example ~/.tmux.conf
mkdir -p ~/.claude ~/.codex
cp .claude-CLAUDE.md.example ~/.claude/CLAUDE.md
cp .codex-AGENTS.md.example ~/.codex/AGENTS.md
```

## AI coding agents

The Claude Code and Codex files set a personal communication preference for
all projects:

> Use ASD-STE100 Simplified Technical English to report to me when discussing technical work.

Claude Code reads `~/.claude/CLAUDE.md`. Codex reads
`~/.codex/AGENTS.md`. Start a new session after you change either file.

## SSH agent forwarding

Agent forwarding lets Git commands on a trusted remote Mac use an SSH key from
your local agent. It avoids unlocking the remote login keychain or copying a
private key to the remote host.

Enable it only for specific trusted hosts in `~/.ssh/config`:

```sshconfig
Host brettbook brett-mini
  ForwardAgent yes
```

Before you connect, make sure the local agent has the required key:

```bash
ssh-add -l
```

On macOS, load a key and store its passphrase in the local login keychain with:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

After you connect, `echo "$SSH_AUTH_SOCK"` on the remote host must print a
socket path. A compromised remote host can use the forwarded agent while the
SSH connection is open, but it cannot copy the private key from the agent. Do
not enable `ForwardAgent` globally with `Host *`.

## Vim

Copy `.vimrc.example` to `~/.vimrc`. Enables syntax highlighting, line numbers, and sensible defaults.

macOS note: The default `/usr/bin/vim` can be minimal. If syntax highlighting still doesn't work, install via Homebrew: `brew install vim`

## Tmux

Copy `.tmux.conf.example` to `~/.tmux.conf`. Includes:
- Mouse support
- Vim-style pane navigation (`prefix + h/j/k/l`)
- Vim-style pane resizing (`prefix + H/J/K/L`)
- Vim-style copy mode
- OSC 52 clipboard support (works with Ghostty)
- Session and layout persistence with [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- Automatic snapshots every 10 minutes with [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

Install both plugins before loading the config:

```bash
~/boots/install-tmux-plugins.sh
tmux source-file ~/.tmux.conf
```

The installer and config use paths below `$HOME`; there are no host-specific
paths or assumptions. Snapshots are written to
`~/.local/share/tmux/resurrect`, with old snapshots pruned by tmux-resurrect.

Save with `prefix + Ctrl-s` and restore with `prefix + Ctrl-r`. Startup restore
is intentionally disabled so an old snapshot is never applied unexpectedly.

## Herdr (nested tmux)

Herdr wraps an inner tmux, and both default to `Ctrl-b`. Herdr's default
`close_pane = "prefix+x"` fires on the first `Ctrl-b x`, so a kill-pane
meant for tmux instead kills the Herdr pane (no confirmation). Rebinding
`close_pane` onto `prefix+shift+x` leaves plain `prefix+x` free for tmux.

```bash
cp herdr-config.example ~/.config/herdr/config.toml
herdr config check          # validate
herdr server reload-config   # apply to the running server
```

`prefix+shift+x` is Herdr's default `close_tab`, so the example also moves
`close_tab` to `prefix+ctrl+x`. See `HOW-HERDR-TMUX-WORKS.md` for the full
default keybinding table, the alternatives, and how to test the rebind.

## Wiring up Aliases

Import the aliases (with appropriate path) in .zshrc

## Ghostty Themes

https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/ghostty

See `HOW-THEMES-WORK.md` for the theme cycling system.
