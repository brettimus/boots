#!/bin/bash

# https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/ghostty/Dracula

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 21/22/2c
cset 1 ff/55/55
cset 2 50/fa/7b
cset 3 f1/fa/8c
cset 4 bd/93/f9
cset 5 ff/79/c6
cset 6 8b/e9/fd
cset 7 f8/f8/f2
cset 8 62/72/a4
cset 9 ff/6e/6e
cset 10 69/ff/94
cset 11 ff/ff/a5
cset 12 d6/ac/ff
cset 13 ff/92/df
cset 14 a4/ff/ff
cset 15 ff/ff/ff

# Set background color
echo -ne "\033]11;rgb:28/2a/36\007"

# Set foreground color
echo -ne "\033]10;rgb:f8/f8/f2\007"

# Set cursor color
echo -ne "\033]12;rgb:f8/f8/f2\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:44/47/5a\007"  # Selection background
echo -ne "\033]19;rgb:ff/ff/ff\007"  # Selection foreground
