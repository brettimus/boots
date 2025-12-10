#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 05/04/04
cset 1 bd/00/13
cset 2 4a/b1/18
cset 3 e7/74/1e
cset 4 0f/4a/c6
cset 5 66/59/93
cset 6 70/a5/98
cset 7 f8/dc/c0
cset 8 4e/7c/bf
cset 9 fc/5f/5a
cset 10 9e/ff/6e
cset 11 ef/c1/1a
cset 12 19/97/c6
cset 13 9b/59/53
cset 14 c8/fa/f4
cset 15 f6/f5/fb

# Set background color
echo -ne "\033]11;rgb:1f/1d/45\007"

# Set foreground color
echo -ne "\033]10;rgb:f8/dc/c0\007"

# Set cursor color
echo -ne "\033]12;rgb:ef/bf/38\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:70/6b/4e\007"  # Selection background
echo -ne "\033]19;rgb:f3/d9/c4\007"  # Selection foreground