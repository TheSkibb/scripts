#/bin/bash
# this script is for screenshots on wayland
# requires slurp and grim

if [[ $1 = "--clipboard" ]]; then
    tempimgpath=$(grimshot save area)
    cat $tempimgpath | wl-copy
    rm $tempimgpath
else
    read -p "enter filename: " filename

    if [ -z "${filename}" ]; then
        filename=$(date +'screenshot_%Y-%m-%d-%H%M%S')
        echo "empty filename using $filename"
    fi

    slurp | grim -g - $(xdg-user-dir PICTURES)/screenshots/$filename.png
fi
