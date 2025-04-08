#!/bin/bash
# uses fzf --preview to easily select a diff you wat to inspect further

selected=$(git status --short | fzf --preview 'git diff --color $(echo {} | cut -c 4-)')
git diff $(echo $selected | cut -c 3-)
