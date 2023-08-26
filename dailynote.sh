!#/usr/bin/zsh
# script to open the daily note in the obsidian vault

NOTE=$HOME/Documents/Obsidian\ "Vault"/
DAILY=daily\ "notes"

date=$(date '+%Y-%m-%d')

#running nvim from binary file lol
editor=/home/kristian/Programs/nvim-linux64/bin/nvim

cd "$NOTE"
$editor "$DAILY"/"$date".md
