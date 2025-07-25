#! /usr/bin/env bash

# cht: search cheat.sh 
#

display_program=bat

read -p "search cheat.sh: " user_input

curl -s cheat.sh/$user_input | $display_program
