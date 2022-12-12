#!/bin/sh
echo = $(</dev/random tr -dc 'A-Z-a-z-0-9' | fold -w10 | head -1) >> TEST
