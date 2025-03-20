#! /bin/bash

selection=$(podman ps -a --format "{{.ID}} {{.Names}} {{.Image}}" | fzf)

if [[ -n "$selection" ]]; then

    id=$(echo $selection | cut -c -12)
    command=$(podman ps --filter id=$id --format "{{.Command}}")
    echo $command
    podman start $id && podman exec -it $id $command

else
    echo "no selection made"
fi
