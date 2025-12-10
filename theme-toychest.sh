#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 2c/3f/58
cset 1 be/2d/26
cset 2 1a/91/72
cset 3 db/8e/27
cset 4 32/5d/96
cset 5 8a/5e/dc
cset 6 35/a0/8f
cset 7 23/d1/83
cset 8 33/68/89
cset 9 dd/59/44
cset 10 31/d0/7b
cset 11 e7/d8/4b
cset 12 34/a6/da
cset 13 ae/6b/dc
cset 14 42/c3/ae
cset 15 d5/d5/d5

# Set background color
echo -ne "\033]11;rgb:24/36/4b\007"

# Set foreground color
echo -ne "\033]10;rgb:31/d0/7b\007"

# Set cursor color
echo -ne "\033]12;rgb:d5/d5/d5\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:5f/21/7a\007"  # Selection background
echo -ne "\033]19;rgb:d5/d5/d5\007"  # Selection foreground