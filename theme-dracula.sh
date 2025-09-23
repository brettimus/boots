#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 00/00/00
cset 1 ff/55/55
cset 2 50/fa/7b
cset 3 f1/fa/8c
cset 4 bd/93/f9
cset 5 ff/79/c6
cset 6 8b/e9/fd
cset 7 bb/bb/bb
cset 8 55/55/55
cset 9 ff/55/55
cset 10 50/fa/7b
cset 11 f1/fa/8c
cset 12 bd/93/f9
cset 13 ff/79/c6
cset 14 8b/e9/fd
cset 15 ff/ff/ff

# Set background color
echo -e "\033]11;rgb:1e/1f/29\007"

# Set foreground color
echo -e "\033]10;rgb:e6/e6/e6\007"

# Set cursor color
echo -e "\033]12;rgb:bb/bb/bb\007"

# Optionally, include selection background and foreground colors
echo -e "\033]17;rgb:44/47/5a\007"  # Selection background
echo -e "\033]19;rgb:ff/ff/ff\007"  # Selection foreground