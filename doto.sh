#! /usr/bin/env bash

# Search for all instances of TODO: recursively from the current directory
# Preview 5 lines above and below the match in fzf
# Use grep to find instances of TODO and pipe to fzf
grep -rnw . -e 'TODO:' | fzf --preview 'echo {1}; echo {2}' 
