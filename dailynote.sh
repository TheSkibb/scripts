# script to open the daily note in the obsidian vault

NOTE=$HOME/skolearbeidUiA/matte/semester2/notes
DAILY=dailyNotes
WEEKLY=weeklyNotes


#running nvim from binary file lol
editor=/home/kristian/Programs/nvim-linux64/bin/nvim

cd "$NOTE"

if [ $1 = "daily" ]; then
    date=$(date '+%Y-%m-%d')
    $editor "$DAILY"/"$date".md
elif [ $1 = "weekly" ]; then
    date=$(date '+%Y-W%W')
    $editor "$WEEKLY"/"$date".md
fi


