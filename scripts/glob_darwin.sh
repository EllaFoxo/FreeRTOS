#!/usr/bin/env sh

gfind src/ -maxdepth 1 \( -iname \*.c \)
gfind src/portable/Common/ \( -iname \*.c \)
