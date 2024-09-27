read -p "enter filename: " filename

if [ -z "${filename}" ]; then
echo "empty"
filename=$(date +'screenshot_%Y-%m-%d-%H%M%S')
fi

slurp | grim -g - $(xdg-user-dir PICTURES)/screenshots/$filename.png
