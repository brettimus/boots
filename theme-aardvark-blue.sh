#!/bin/bash

# Function to set palette colors
function cset() {
  ANSI=$1
  RGB=$2
  printf "\x1b]4;$ANSI;rgb:${RGB}\a"
}

# Palette colors
cset 0 19/19/19
cset 1 aa/34/2e
cset 2 4b/8c/0f
cset 3 db/ba/00
cset 4 13/70/d3
cset 5 c4/3a/c3
cset 6 00/8e/b0
cset 7 be/be/be
cset 8 52/52/52
cset 9 f0/5b/50
cset 10 95/dc/55
cset 11 ff/e7/63
cset 12 60/a4/ec
cset 13 e2/6b/e2
cset 14 60/b6/cb
cset 15 f7/f7/f7

# Set background color
echo -ne "\033]11;rgb:10/20/40\007"

# Set foreground color
echo -ne "\033]10;rgb:dd/dd/dd\007"

# Set cursor color
echo -ne "\033]12;rgb:00/7a/cc\007"

# Optionally, include selection background and foreground colors
echo -ne "\033]17;rgb:bf/db/fe\007"  # Selection background
echo -ne "\033]19;rgb:00/00/00\007"  # Selection foreground
