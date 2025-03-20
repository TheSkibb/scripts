#! /bin/bash

selection=$(podman ps -a --format "{{.ID}} {{.Names}} {{.Image}}" | fzf)

if [[ -n "$selection" ]]; then

    id=$(echo $selection | cut -c -12)
    podman start $id && podman exec -it $id /bin/bash

else
    echo "no selection made"
fi
