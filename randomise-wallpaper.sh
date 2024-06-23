#!/usr/bin/bash

# quick script to pick a random jpg from the wallpapers directory and then use it for the hyprland wallpaper

# the find command spits out absolute filenames if given an absolute directory path to search
# sort -R sorts (pseudo)randomly
# tail -1 grabs the last line

# TODO: can we use png in hyprpaper? if so, can we grap jpg and png?

# TODO: allow selection of the dir to search??


find /usr/local/share/wallpapers -name *.jpg | sort -R | tail -1 | while read file; do
    /usr/local/bin/change-wallpaper.sh $file;
done
