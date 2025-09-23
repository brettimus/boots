#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 f2/e9/de
cset 1 b4/63/7a
cset 2 56/94/9f
cset 3 ea/9d/34
cset 4 28/69/83
cset 5 90/7a/a9
cset 6 d7/82/7e
cset 7 57/52/79
cset 8 6e/6a/86
cset 9 b4/63/7a
cset 10 56/94/9f
cset 11 ea/9d/34
cset 12 28/69/83
cset 13 90/7a/a9
cset 14 d7/82/7e
cset 15 57/52/79

# Set background color
echo -e "\033]11;rgb:faf4ed\007"

# Set foreground color
echo -e "\033]10;rgb:57/52/79\007"

# Set cursor color
echo -e "\033]12;rgb:98/93/a5\007"

# Optionally, you can include selection background and foreground colors if your terminal supports them
echo -e "\033]17;rgb:ee/e9/e6\007"  # Selection background
echo -e "\033]19;rgb:57/52/79\007"  # Selection foreground