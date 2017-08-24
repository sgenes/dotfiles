## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"

## super user alias
alias _='sudo'
alias please='sudo'
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -sel clip -o'
alias a='browse . &> /dev/null'

## more intelligent acking for ubuntu users
if which ack-grep &> /dev/null; then
	alias afind='ack-grep -il'
else
	alias afind='ack -il'
fi

# only define LC_CTYPE if undefined
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
	export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

# recognize comments
setopt interactivecomments
