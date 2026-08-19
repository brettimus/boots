# shell aliases
alias l.='ls -d .*'
alias ll='ls -lh'              # Long format with human-readable sizes
alias la='ls -lAh'             # Long format, all files including hidden
alias lt='ls -lth'             # Sort by modification time, newest first
alias lS='ls -lSh'             # Sort by size, largest first
alias l='ls -CF'               # Compact format with indicators

# Commented out because it messes up Claude Code with the confirm
# alias rm='rm -i'               # Confirm before deleting
# alias cp='cp -i'               # Confirm before overwriting
# alias mv='mv -i'               # Confirm before overwriting
alias mkdir='mkdir -p'         # Create parent directories as needed

alias ...='cd ../..'
alias ....='cd ../../..'

# Claude after two whiskeys and a horse named Trouble
alias clyde='claude --dangerously-skip-permissions'

# Party Codex
alias yodex='codex --dangerously-bypass-approvals-and-sandbox'

# Geminiolo
alias gioia='gemini --approval-mode yolo'

# git aliases
alias gita='git add .'
alias gitc='git commit'
alias gits='git status'
alias gitb='git branch'
alias gpo='git push origin'
alias gitfix='git add -A && git commit --amend --no-edit'
alias gsmp='git switch main && git pull && git switch -'

# ffmpeg: compress a QuickTime screen recording (.mov -> smaller .mp4)
# Usage: convert-recording input.mov [output.mp4]
alias convert-recording='~/boots/convert-screen-recording.sh'

# ghostty themes
alias adventure-time='source ~/boots/theme-adventure-time.sh'
alias github='source ~/boots/theme-github.sh'
alias toychest='source ~/boots/theme-toychest.sh'
alias dracula='source ~/boots/theme-dracula.sh'
alias yellow='source ~/boots/theme-yellow.sh'
alias rose-pine-moon='source ~/boots/theme-rose-pine-moon.sh'
alias rose-pine-dawn='source ~/boots/theme-rose-pine-dawn.sh'
alias solarized-light='source ~/boots/theme-solarized-light.sh'
alias solarized-dark='source ~/boots/theme-solarized-dark.sh' # kinda foresty
alias 12bit-rainbow='source ~/boots/theme-12bit-rainbow.sh'
alias aardvark-blue='source ~/boots/theme-aardvark-blue.sh'
alias rose=rose-pine-moon
alias solarized=solarized-dark
