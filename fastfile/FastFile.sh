#! /bin/sh
# TUI app inspired by the ranger file manager
#

# prev dir
draw_prev(){
    tput clear
    x_pos=0
    y_pos=0
    array=( $( /bin/ls -a -I . -I .. .. ) )
    tput cup $y_pos $x_pos
    for item in "${array[@]}"; do
        tput cup $y_pos $x_pos
        let "y_pos += 1"
        echo $item
    done
}

#current dir
#highlights selected dir

RED_FG=`tput setaf 1`
GREEN_BG=`tput setab 2`
RESET=`tput sgr0`

current_high=2

#argument 1 - hvilket item i lista som skal highlightes
draw_current(){
    array_current=( $( /bin/ls -a -I . -I .. . ) )

    x_pos=30
    y_pos=0
    length="${#array_current[@]}"

    for i in {0..$length}
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

draw_next(){
    current_dir=$(pwd)
    current_file=$current_dir/$array_current[$current_high]
    echo $( ls $current_file)
    array_next=( $( ls $current_file -a -I . -I .. . ) )

    x_pos=60
    y_pos=0
    length="${#array_next[@]}"


    for i in {0..$length}
    do
        tput cup $y_pos $x_pos
        if [[ $i -gt 0 ]]
        then
            echo $array_next[$i]
            let "y_pos += 1"
        fi
    done
}

while [[ true ]]
do
    draw_prev
    draw_current
    draw_next
    x_pos=0
    y_pos=10
    tput cup $y_pos $x_pos
    #echo $( ls $array_current[$current_high])
    read -t3 -k1 -s keypress
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
        cd $array_current[$current_high]
    fi

done

#tput cup $x_pos $y_pos
#echo test
#y_pos=$y_pos+1
#echo test2
