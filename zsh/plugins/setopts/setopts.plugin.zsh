# jobs
setopt longlistjobs

# recognize comments
setopt interactivecomments

# disable no match warning
unsetopt nomatch

# history
setopt appendhistory
setopt extendedhistory
setopt histexpiredupsfirst
setopt incappendhistory
# ignore duplication command history list
setopt histignorealldups
# share command history data
setopt sharehistory

setopt autopushd
setopt pushdignoredups
setopt nobeep
setopt autocd
setopt multios
setopt cdablevars
# do not autoselect the first completion entry
unsetopt menu_complete
# show completion menu on succesive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt prompt_subst
