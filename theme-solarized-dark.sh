#!/bin/bash

# https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/ghostty/Builtin%20Solarized%20Dark

# Function to set ANSI color palette entries
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# ANSI color palette (0–15)
cset 0 07/36/42
cset 1 dc/32/2f
cset 2 85/99/00
cset 3 b5/89/00
cset 4 26/8b/d2
cset 5 d3/36/82
cset 6 2a/a1/98
cset 7 ee/e8/d5
cset 8 00/2b/36
cset 9 cb/4b/16
cset 10 58/6e/75
cset 11 65/7b/83
cset 12 83/94/96
cset 13 6c/71/c4
cset 14 93/a1/a1
cset 15 fd/f6/e3

# Background color
echo -ne "\033]11;rgb:00/2b/36\007"

# Foreground (text) color
echo -ne "\033]10;rgb:83/94/96\007"

# Cursor color
echo -ne "\033]12;rgb:83/94/96\007"

# Selection background & foreground
echo -ne "\033]17;rgb:07/36/42\007"  # selection-background
echo -ne "\033]19;rgb:93/a1/a1\007"  # selection-foreground