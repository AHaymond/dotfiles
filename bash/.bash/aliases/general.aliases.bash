# vim to NeoVim ( use \vim to ignore alias and load vim)
alias vim="nvim"
alias vi="nvim"

# List directory contents
alias sl=ls
alias lsn="ls --color=never"
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias ldu='du -cks * | sort -rn | head -15' # Lists the size of all the folders

alias grep="grep -E --color=auto --exclude-dir=.git"

alias gen_ctags="ctags --recurse=yes --exclude=.git --exclude=BUILD --exclude=.svn --exclude=vendor/* --exclude=node_modules/* --exclude=db/* --exclude=log/*"

# Enable aliases to be sudo’ed
alias sudo='sudo '

alias _="sudo"

# IP addresses
#alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"
fi
which gshuf &> /dev/null
if [ $? -eq 1 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"

alias rb='ruby'

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/
alias piano='pianobar'

alias ~='cd ~'
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias	md='mkdir -p'
alias	rd='rmdir'

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

alias cp='cp -iv'               # Preferred 'cp' implementation
alias rm='rm -iv'               # Preferred 'rm' implementation
alias mv='mv -i'                # Preferred 'mv' implementation
alias mkdir='mkdir -pv'         # Preferred 'mkdir' implementation
alias less='less -FSRXc'        # Preferred 'less' implementation
alias .3='cd ../../..'          # Go back 3 directory levels
alias .4='cd ../../../..'       # Go back 4 directory levels
alias .5='cd ../../../../..'    # Go back 5 directory levels
alias .6='cd ../../../../../..' # Go back 6 directory levels
alias ~="cd ~"                  # ~: Go Home

alias path='echo -e ${PATH//:/\\n}'  # Print out PATH with newlines after each path
alias now='date -u && date'
alias keyboard='systemctl --user start keyboard'
alias unicreds='assume_profile prod unicreds -r us-east-1'
alias go-kamino='projects && tapresearch && cd kamino'
alias tm='projects && cd tm'

alias projects='cd ~/Projects'

alias tapresearch='projects && cd tapresearch'
alias raynor='tapresearch && cd raynor'
alias tapinfra='tapresearch && cd tap_devops/infrastructure'
alias shiloh='tapresearch && cd tap_devops/shiloh'
