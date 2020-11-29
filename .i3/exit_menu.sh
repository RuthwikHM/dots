#!/bin/bash
while [ "$select" != "No" -a "$select" != "Yes" ]; do
    select=$(echo -e 'Yes\nNo' | dmenu -nb '#282a36' -nf '#f8f8f2' -sb '#2e3440' -sf '#bd93f9' -fn 'Noto-11.5' -i -p "Exiting i3? This will end your X session.")
    [ -z "$select" ] && exit 0
done
[ "$select" = "No" ] && exit 0
i3-msg exit
