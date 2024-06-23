#!/usr/bin/bash

# This is a quick script to change the wallpaper in hyprland, using its IPC command hyprctl
# The point is to use this to randomise wallpaper selection and change it every half hour

# Usage: change-wallpaper.sh $file

hyprctl hyprpaper preload "$1"

hyprctl hyprpaper wallpaper ",$1"

