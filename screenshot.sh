#/bin/bash
# this script is for screenshots on wayland
# requires slurp and grim

read -p "enter filename: " filename

if [ -z "${filename}" ]; then
filename=$(date +'screenshot_%Y-%m-%d-%H%M%S')
echo "empty filename using $filename"
fi

slurp | grim -g - $(xdg-user-dir PICTURES)/screenshots/$filename.png
