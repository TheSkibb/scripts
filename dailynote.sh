#!/bin/bash
# script to open the daily note in the obsidian vault

NOTE=$HOME/Notes
DAILY_DIR=dailyNotes
WEEKLY_DIR=weeklyNotes

DAILY_FORMAT='+%Y-%m-%d'
WEEKLY_FORMAT='+%Y-W%W'

if [[ -z $EDITOR ]]; then
	editor=$EDITOR
else
	editor=vim
fi

cd "$NOTE"

if [ $1 = "daily" ]; then
    local date=$(date $DAILY_FORMAT)
    $editor "$DAILY_DIR"/"$date".md
elif [ $1 = "weekly" ]; then
    local date=$(date $WEEKLY_FORMAT)
    $editor "$WEEKLY_DIR"/"$date".md
fi


