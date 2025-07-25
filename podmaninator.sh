#! /bin/bash

selection=$(podman ps -a --format "{{.ID}} {{.Names}} {{.Image}}" | fzf)

if [[ -n "$selection" ]]; then

    local id=$(echo $selection | cut -c -12)
    local command=$(podman ps -a --filter id=$id --format "{{.Command}}")
    #echo "starting $id with $command"
    podman start $id && podman exec -it $id $command

else
    echo "no selection made"
fi
