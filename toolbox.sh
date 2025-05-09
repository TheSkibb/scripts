#! /bin/bash

editor=nvim
preview=bat
tbDir=~/toolbox

cd $tbDir

choice=$(fzf --preview "$preview {}")

if [[ -n "$choice" ]]; then
    $editor $choice
fi
