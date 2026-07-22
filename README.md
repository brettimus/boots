# The Setup van Boots

My (backed up) setup for zsh, vim, tmux, and terminal config.

## Quick Start

```bash
# Copy configs to home directory
cp .zshrc.example ~/.zshrc
cp .zprofile.example ~/.zprofile
cp .vimrc.example ~/.vimrc
cp .tmux.conf.example ~/.tmux.conf
```

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

Install tmux-resurrect before loading the config:

```bash
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
```

Save with `prefix + Ctrl-s` and restore with `prefix + Ctrl-r`.

## Wiring up Aliases

Import the aliases (with appropriate path) in .zshrc

## Ghostty Themes

https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/ghostty

See `HOW-THEMES-WORK.md` for the theme cycling system.
