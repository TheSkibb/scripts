#!/bin/bash

if [[ -z $EDITOR ]] then
	editor=$EDITOR
else
	editor=vim
fi

file=/tmp/kladd-$1

function run(){
    if [ $# -lt 3 ]; then
        echo "no run environment specified"
    else
        echo "running $file with $3 \n"
        $3 $file
    fi
}

function edit_file(){
    $editor $file
}

if [ $# -gt 2 ] && [ $2 = "run" ]; then
    run $1 $2 $3
elif [ $# -gt 0 ] && [ $1 = "list" ]; then
    ls /tmp/kladd-*
else
    edit_file
fi
