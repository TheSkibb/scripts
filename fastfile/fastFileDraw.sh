tput civis
tput smcup

# Run your script inside a subshell
(
  clear
  echo "Hello, this text will disappear when the script ends!"
  clear
)

# Show the cursor and exit alternate screen
tput cnorm
tput rmcup
