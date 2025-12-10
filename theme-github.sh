#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 24/29/2f
cset 1 cf/22/2e
cset 2 11/63/29
cset 3 4d/2d/00
cset 4 09/69/da
cset 5 82/50/df
cset 6 1b/7c/83
cset 7 6e/77/81
cset 8 57/60/6a
cset 9 a4/0e/26
cset 10 1a/7f/37
cset 11 63/3c/01
cset 12 21/8b/ff
cset 13 a4/75/f9
cset 14 31/92/aa
cset 15 8c/95/9f

# Set background color
echo -ne "\033]11;rgb:ff/ff/ff\007"

# Set foreground color
echo -ne "\033]10;rgb:1f/23/28\007"

# Set cursor color
echo -ne "\033]12;rgb:09/69/da\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:1f/23/28\007"  # Selection background
echo -ne "\033]19;rgb:ff/ff/ff\007"  # Selection foreground