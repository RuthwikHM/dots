#!/bin/bash
 cat ~/.i3/config | grep -e "^bindsym" | sed -e "s/bindsym //" -e "s/\\$//" -e "s/ /\t: /" | yad --text-info --geometry=800x600 --title="Keybindings for i3" --fore=#bd93f9 --back=#282a36
