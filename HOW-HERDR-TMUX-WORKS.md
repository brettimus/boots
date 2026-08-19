# How Herdr + nested tmux work

> Two multiplexers, one prefix: Herdr (outer) wraps an inner tmux, and both
> default to `Ctrl-b`. This note explains the collision and the fix shipped in
> `herdr-config.example`.

## The collision

| Layer | Default `prefix+x` does | Confirmation |
| --- | --- | --- |
| Herdr (outer) | **close_pane** | no |
| tmux (inner) | kill-pane | yes |

Because Herdr sees the keystroke first, an unguarded `Ctrl-b x` meant for tmux
is intercepted by Herdr and kills the Herdr pane outright. To reach tmux you
must escape Herdr's prefix with a double tap:

```text
Ctrl-b  Ctrl-b  x   ->  tmux kill-pane
```

Forgetting the second `Ctrl-b` is the trap.

## The fix (this repo's default)

Rebind Herdr's `close_pane` off `prefix+x` and onto the deliberate capital-X
chord, so plain `prefix+x` no longer does anything destructive in Herdr:

```toml
[keys]
close_pane = "prefix+shift+x"   # was "prefix+x" (the collision)
close_tab  = "prefix+ctrl+x"    # was "prefix+shift+x" (now free for close_pane)
```

`close_tab` has to move too: `prefix+shift+x` is Herdr's default close-tab
binding, so leaving it there would put two actions on one chord.

After the rebind:

```text
Ctrl-b  Shift-x   ->  Herdr close_pane   (deliberate: capital X)
Ctrl-b  Ctrl-b  x ->  tmux kill-pane     (unchanged)
Ctrl-b  Ctrl-x   ->  Herdr close_tab     (moved)
```

## Why not the alternatives

- **Change Herdr's prefix to `Ctrl-a`.** Eliminates the double-prefix tax
  entirely, but remaps muscle memory for every Herdr chord. Rejected here in
  favor of the one-binding rebind. (Set `prefix = "ctrl+a"` under `[keys]` if
  you ever want it.)
- **`ui.confirm_close = true`.** Tempting, but Herdr's own template documents
  this as "confirmation before closing a **workspace**" — it does not gate
  pane close, so it will not save an accidental `prefix+x` pane. Keep the
  rebind as the real guard.

## Applying it

```bash
cp herdr-config.example ~/.config/herdr/config.toml
herdr config check          # validate; prints "config: ok" or the bad key
herdr server reload-config  # apply to the running server without restarting
```

Undo at any time:

```bash
herdr config reset-keys     # backs up config.toml and drops [keys]/custom cmds
```

Then test in a running Herdr session (don't take the config's word for it):

1. Focus a Herdr pane running inner tmux.
2. Press `Ctrl-b x` — nothing should die. (tmux never sees it; Herdr has no
   binding there.)
3. Press `Ctrl-b Ctrl-b x` — tmux kill-pane prompt appears.
4. Press `Ctrl-b Shift-x` — Herdr closes the pane.
5. Press `Ctrl-b` then `?` — the keybind help lists the new close_pane /
   close_tab chords and shows no collision.

## The schema (herdr 0.7.5, stable)

`[keys]` is a flat table. `prefix` itself is settable here. Each action maps
to a string:

- `"prefix+n"` — a prefix-mode action (tap `Ctrl-b`, then `n`).
- `"ctrl+alt+n"` — a direct terminal-mode shortcut (no prefix).
- Accepted: plain keys, `ctrl`/`shift`/`alt`/`cmd`/`super` modifiers, special
  keys (`enter`/`tab`/`esc`/arrows), and named punctuation
  (`minus`/`comma`/`ampersand`/`plus`/`backtick`).
- Most reliable through nested tmux: `ctrl+letter`, function keys, and
  explicit modified chords. `alt`/`cmd`/`super` and punctuation-with-modifiers
  depend on the terminal/tmux setup.

### Default keybindings (reference)

Sourced from the binary's own default template. Commented lines are unset by
default.

| Action | Default |
| --- | --- |
| `prefix` | `"ctrl+b"` |
| `help` | `"prefix+?"` |
| `settings` | `"prefix+s"` |
| `detach` | `"prefix+q"` |
| `reload_config` | `"prefix+shift+r"` |
| `open_notification_target` | `"prefix+o"` |
| `workspace_picker` | `"prefix+w"` |
| `goto` | `"prefix+g"` |
| `new_workspace` | `"prefix+shift+n"` |
| `new_worktree` | `"prefix+shift+g"` |
| `open_worktree` | `""` (unset) |
| `remove_worktree` | `""` (unset; opens confirmation) |
| `rename_workspace` | `"prefix+shift+w"` |
| `close_workspace` | `"prefix+shift+d"` |
| `previous_workspace` / `next_workspace` | `""` (unset) |
| `previous_agent` / `next_agent` | `""` (unset) |
| `focus_agent` | `""` (unset; indexed, e.g. `"prefix+alt+1..9"`) |
| `remote_image_paste` | `"ctrl+v"` (only in `herdr --remote`) |
| `new_tab` | `"prefix+c"` |
| `rename_tab` | `"prefix+shift+t"` |
| `previous_tab` | `"prefix+p"` |
| `next_tab` | `"prefix+n"` |
| `switch_tab` | `"prefix+1..9"` |
| `switch_workspace` | `""` (unset; indexed, e.g. `"prefix+shift+1..9"`) |
| `close_tab` | `"prefix+shift+x"` |
| `rename_pane` | `"prefix+shift+p"` |
| `edit_scrollback` | `"prefix+e"` |
| `focus_pane_left` / `_down` / `_up` / `_right` | `"prefix+h"` / `"j"` / `"k"` / `"l"` |
| `cycle_pane_next` | `"prefix+tab"` |
| `cycle_pane_previous` | `"prefix+shift+tab"` |
| `last_pane` | `""` (unset; bind e.g. `"prefix+tab"`) |
| `split_vertical` | `"prefix+v"` |
| `split_horizontal` | `"prefix+minus"` |
| `close_pane` | `"prefix+x"` |
| `zoom` | `"prefix+z"` (legacy alias: `fullscreen`) |
| `resize_mode` | `"prefix+r"` |
| `toggle_sidebar` | `"prefix+b"` |

Navigate-mode movement (local shortcuts that win while navigate mode is open;
do **not** include `prefix+`, `esc`, `enter`, `tab`, or `1..9`):

| Action | Default |
| --- | --- |
| `navigate_workspace_up` / `_down` | `"up"` / `"down"` |
| `navigate_pane_left` / `_down` / `_up` / `_right` | `"h"` / `"j"` / `"k"` / `"l"` |

### Indexed shortcuts (optional)

```toml
[keys.indexed]
tabs = ""       # "ctrl"        -> ctrl+1..9 switches tabs directly
workspaces = "" # "ctrl+shift"  -> ctrl+shift+1..9 switches workspaces
agents = ""     # "alt"         -> alt+1..9 focuses agent rows
```

### Custom commands

```toml
[[keys.command]]
key = "prefix+alt+g"
type = "popup"          # run in a popup; width/height accept cells or "80%"
command = "lazygit"
width = "80%"
height = "80%"
```

## Version caveat

The keybinding schema moves between Herdr versions (the 0.8.0 preview already
adds `ui.pane_scrollbars`, `ui.tab_bar_position`, etc.). This note was written
against `herdr 0.7.5` (stable), verified with `herdr config check` and the
binary's own default-template strings. After any upgrade, re-run
`herdr config check` and press `Ctrl-b ?` to confirm the resolved bindings.
