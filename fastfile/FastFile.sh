#! /bin/bash
# TUI app inspired by the ranger file manager

current_high=1

print_current(){
    array_current=( $( /bin/ls -a -I . -I .. . ) )
    echo $array_current
    length="${#array_current[@]}"
}


print_prev(){
    array_prev=( $( /bin/ls -a -I . -I .. .. ) )
    echo $array_prev
    length="${#array_prev[@]}"
}

print_next(){
    ls
}

go_next(){
    cd $array_current[$current_high]
}

# $1 array
# $2 x_pos
print_array(){
}

while [ true ]
do
    tput clear
    echo $array_current[$current_high] " " $current_high
    print_prev
    print_current
    print_next

    read -k1 -s keypress

    if [ $keypress = "j" ] && [ $current_high -lt $length ]
    then
        let "current_high += 1"
    fi

    if [ $keypress = "k" ] && [ $current_high -gt 1 ]
    then
        let "current_high -= 1"
    fi

    if [ $keypress = "h" ]
    then
        cd ..
    fi

    if [ $keypress = "l" ]
    then
        go_next
    fi

    if [ $keypress = "o" ]
    then
        ls
    fi
done
