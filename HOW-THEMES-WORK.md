# How the themes work

> A litte interlude on how the themes + theme selection work

In `aliases.sh`, you'll see:

```sh
alias adventure-time='source ~/boots/theme-adventure-time.sh'
alias github='source ~/boots/theme-github.sh'
alias toychest='source ~/boots/theme-toychest.sh'
# ...
```

These aliases map to executable scripts in this repo.

All the scripts do is invoke a function that sets the palette colors.

For theme auto selection, there's a function in `.zshrc.example` called `"auto_select_theme"`.

- Runs for every new shell
- Skips when inside Cursor of VSCode


## Creating a new theme

I made most of the themes in ChatGPT looooong ago. I had a prompt that gave an example script (e.g., `theme-adventure-time.sh`) as a reference, then gave the link to the GitHub repo with themes: https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/ghostty

I would then give the name of another theme (or just copy it in) and ask for an adapted script.

Obviously you could now do this in Cursor or Claude Code quite easily.

To make it work in auto_select_theme, you need to add the name of the theme to the list it uses to cycle.