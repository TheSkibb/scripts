# script to open the daily note in the obsidian vault

NOTE=$HOME/skolearbeidUiA/matte/semester2/notes
DAILY_DIR=dailyNotes
WEEKLY_DIR=weeklyNotes

DAILY_FORMAT='+%Y-%m-%d'
WEEKLY_FORMAT='+%Y-W%W'


#running nvim from binary file lol
editor=/home/kristian/Programs/nvim-linux64/bin/nvim

cd "$NOTE"

if [ $1 = "daily" ]; then
    date=$(date $DAILY_FORMAT)
    $editor "$DAILY_DIR"/"$date".md
elif [ $1 = "weekly" ]; then
    date=$(date $WEEKLY_FORMAT)
    $editor "$WEEKLY_DIR"/"$date".md
fi


