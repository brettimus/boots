#!/bin/bash

# Function to set ANSI color palette entries
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# ANSI color palette (0–15)
cset 0 f2/e9/e1
cset 1 b4/63/7a
cset 2 28/69/83
cset 3 ea/9d/34
cset 4 56/94/9f
cset 5 90/7a/a9
cset 6 d7/82/7e
cset 7 57/52/79
cset 8 98/93/a5
cset 9 b4/63/7a
cset 10 28/69/83
cset 11 ea/9d/34
cset 12 56/94/9f
cset 13 90/7a/a9
cset 14 d7/82/7e
cset 15 57/52/79

# Background color
echo -e "\033]11;rgb:fa/f4/ed\007"

# Foreground (text) color
echo -e "\033]10;rgb:57/52/79\007"

# Cursor color
echo -e "\033]12;rgb:57/52/79\007"

# Selection background & foreground
echo -e "\033]17;rgb:df/da/d9\007"  # selection-background
echo -e "\033]19;rgb:57/52/79\007"  # selection-foreground