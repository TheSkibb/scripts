#! /bin/bash

selection=$(podman ps -a --format "{{.ID}} {{.Image}}" | fzf)

id=$(echo $selection | cut -c -12)

podman start $id && podman exec -it $id /bin/bash
