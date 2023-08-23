#! /bin/zsh
# TUI app inspired by the ranger file manager

current_high=1
RED_FG=`tput setaf 1`
GREEN_BG=`tput setab 2`
RESET=`tput sgr0`

print_current(){
    array_current=( $( /bin/ls -a -I . -I .. . ) )

    x_pos=30
    y_pos=0
    length="${#array_current[@]}"

    for i in {1..$length}
    do
        tput cup $y_pos $x_pos
        if [[ $i -eq $current_high ]]
        then
            high=$array_current[$i]
            echo "${GREEN_BG}${high}${RESET}"
            let "y_pos += 1"
        elif [[ $i -gt 0 ]]
        then
            echo $array_current[$i]
            let "y_pos += 1"
        fi
    done
}

print_prev(){
    array_prev=( $( /bin/ls -a -I . -I .. .. ) )
    x_pos=0
    y_pos=0
    length="${#array_prev[@]}"

    for i in {1..$length}
    do
        tput cup $y_pos $x_pos
        echo $array_prev[$i]
        let "y_pos += 1"
    done
}

print_next(){
    array_next=( $(ls -a -I . -I .. $array_current[$current_high]))

    x_pos=100
    y_pos=0

    for i in {1..${#array_next[@]}}
    do
        tput cup $y_pos $x_pos
        echo $array_next[$i]
        let "y_pos += 1"
    done
}

go_next(){
    x_pos=60
    cd $array_current[$current_high]
    current_high=1
}


while [ true ]
do
    tput clear
    print_prev
    print_current
    print_next

    #print debug info
    x_pos=0
    y_pos=30
    tput cup $y_pos $x_pos
    echo $array_next

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
