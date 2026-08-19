#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors (Rose Pine Moon — dark)
cset 0 39/35/52
cset 1 eb/6f/92
cset 2 3e/8f/b0
cset 3 f6/c1/77
cset 4 9c/cf/d8
cset 5 c4/a7/e7
cset 6 ea/9a/97
cset 7 e0/de/f4
cset 8 6e/6a/86
cset 9 eb/6f/92
cset 10 3e/8f/b0
cset 11 f6/c1/77
cset 12 9c/cf/d8
cset 13 c4/a7/e7
cset 14 ea/9a/97
cset 15 e0/de/f4

# Set background color
echo -ne "\033]11;rgb:23/21/36\007"

# Set foreground color
echo -ne "\033]10;rgb:e0/de/f4\007"

# Set cursor color
echo -ne "\033]12;rgb:e0/de/f4\007"

# Optionally, you can include selection background and foreground colors if your terminal supports them
echo -ne "\033]17;rgb:44/41/5a\007"  # Selection background
echo -ne "\033]19;rgb:e0/de/f4\007"  # Selection foreground
