#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 00/00/00
cset 1 a0/30/50
cset 2 40/d0/80
cset 3 e0/90/40
cset 4 30/60/b0
cset 5 60/30/90
cset 6 00/90/c0
cset 7 db/de/d8
cset 8 68/56/56
cset 9 c0/60/60
cset 10 90/d0/50
cset 11 e0/d0/00
cset 12 00/b0/c0
cset 13 80/10/70
cset 14 20/b0/c0
cset 15 ff/ff/ff

# Set background color
echo -ne "\033]11;rgb:04/04/04\007"

# Set foreground color
echo -ne "\033]10;rgb:fe/ff/ff\007"

# Set cursor color
echo -ne "\033]12;rgb:e0/d0/00\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:60/60/60\007"  # Selection background
echo -ne "\033]19;rgb:ff/ff/ff\007"  # Selection foreground
