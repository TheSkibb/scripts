#! /bin/bash

editor=nvim
preview=bat
tbDir=~/toolbox/tools

cd $tbDir

function main(){

if [[ $1 == "n" ]]; then
    newTool
else
    selectTool
fi
}

function newTool(){

    read -p "new tool filename: " user_input

    #replace all spaces with dashes, and add .md
    local filename="${user_input// /-}.md"

    $editor $filename

    echo "added $filename to the database"
}

function selectTool(){
    local choice=$(fzf --preview "$preview {}")

    if [[ -n "$choice" ]]; then
        $editor $choice
    fi
}

main $1
