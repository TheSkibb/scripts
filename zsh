# source this file in your .zshrc (prob works in bash as well)
# source $HOME/.config/scripts/zsh
#
#

K_SCRIPTS_LOCATION=$HOME/.config/scripts

alias dn="$K_SCRIPTS_LOCATION/dailynote.sh daily"
alias wn="$K_SCRIPTS_LOCATION/dailynote.sh weekly"
alias todo=$K_SCRIPTS_LOCATION/todo.sh
alias fvim='vim "$(fzf)"'
alias screenshot=$K_SCRIPTS_LOCATION/screenshot.sh
alias ff='cd "$(dirname "$(fzf)")"'
alias fopen='xdg-open "$(fzf)"'
alias kladd=$K_SCRIPTS_LOCATION/kladd.sh
alias load-nvm='source $K_SCRIPTS_LOCATION/load-nvm.sh'
alias gd=$K_SCRIPTS_LOCATION/diffinator.sh
alias pd=$K_SCRIPTS_LOCATION/podmaninator.sh
