#!/usr/bin/zsh
editor=/home/kristian/Programs/nvim-linux64/bin/nvim
file=/tmp/kladd-$1

function run(){
    if [ $# -lt 3 ]; then
        echo "no run environment specified"
    else
        echo "running $file with $3"
        $3 $file
    fi
}

function edit_file(){
    $editor /tmp/kladd-$1
}

if [ $# -gt 2 ] && [ $2 = "" ]; then
    run $1 $2 $3
else
    edit_file $1
fi
