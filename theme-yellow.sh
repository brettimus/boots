#!/bin/bash

# Man Page (light, yellow bg) - https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/ghostty/Man%20Page

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 00/00/00
cset 1 cc/00/00
cset 2 00/a6/00
cset 3 99/99/00
cset 4 00/00/b2
cset 5 b2/00/b2
cset 6 00/a6/b2
cset 7 b2/b2/b2
cset 8 66/66/66
cset 9 e5/00/00
cset 10 00/cc/00
cset 11 bf/bf/00
cset 12 00/00/ff
cset 13 e5/00/e5
cset 14 00/cb/cb
cset 15 e5/e5/e5

# Set background color
echo -ne "\033]11;rgb:fe/f4/9c\007"

# Set foreground color
echo -ne "\033]10;rgb:00/00/00\007"

# Set cursor color
echo -ne "\033]12;rgb:7f/7f/7f\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:a4/c9/cd\007"  # Selection background
echo -ne "\033]19;rgb:00/00/00\007"  # Selection foreground
