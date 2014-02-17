
# Overwrite pry with alias for speakez-rails
alias pry='pry -r ./config/environment'

# Change name of terminal window function
function nn
{
    if [ "$1" == "DEFAULT" ]; then
        export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
    else
        export TERMINAL_SUPER_TITLE="$1"
        export PROMPT_COMMAND='echo -ne "\033]0; $TERMINAL_SUPER_TITLE\007"'
    fi
}

#nn "DEFAULT"

# RM require confirmation
alias rm='rm -i'

# Git tab completion
source ~/git-completion.bash

##### Copied from George Marshall ######

##
# Git bash completion scripts
##
# if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  # Git OS X Installer: http://code.google.com/p/git-osx-installer/
  # . /usr/local/git/contrib/completion/git-completion.bash
# elif type brew > /dev/null 2>&1 && [ -f `brew --prefix`/etc/bash_completion ]; then
  # Homebrew: http://mxcl.github.com/homebrew/
  # . `brew --prefix`/etc/bash_completion
# elif [ -f /opt/local/etc/bash_completion.d/git ]; then
  # MacPorts: http://www.macports.org/
  # . /opt/local/etc/bash_completion.d/git
# fi



##
# Shell colors
##
BLACK="\[\e[0;30m\]"  BOLD_BLACK="\[\e[1;30m\]"  UNDER_BLACK="\[\e[4;30m\]"
RED="\[\e[0;31m\]"    BOLD_RED="\[\e[1;31m\]"    UNDER_RED="\[\e[4;31m\]"
GREEN="\[\e[0;32m\]"  BOLD_GREEN="\[\e[1;32m\]"  UNDER_GREEN="\[\e[4;32m\]"
YELLOW="\[\e[0;33m\]" BOLD_YELLOW="\[\e[1;33m\]" UNDER_YELLOW="\[\e[4;33m\]"
BLUE="\[\e[0;34m\]"   BOLD_BLUE="\[\e[1;34m\]"   UNDER_BLUE="\[\e[4;34m\]"
PURPLE="\[\e[0;35m\]" BOLD_PURPLE="\[\e[1;35m\]" UNDER_PURPLE="\[\e[4;35m\]"
CYAN="\[\e[0;36m\]"   BOLD_CYAN="\[\e[1;36m\]"   UNDER_CYAN="\[\e[4;36m\]"
WHITE="\[\e[0;37m\]"  BOLD_WHITE="\[\e[1;37m\]"  UNDER_WHITE="\[\e[4;37m\]"
NO_COLOR="\[\e[0m\]"

##
# Git shell prompt
##
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

PS1="${YELLOW}\h${WHITE} [${GREEN}\W${WHITE}]${WHITE}[${CYAN}\$(parse_git_branch)${RED}\$(parse_git_dirty)${WHITE}]\$${NO_COLOR} "

##### End copied from George Marshall ######

# Show branch in command prompt line
# export PS1="[\W$(__git_ps1 " (%s)")]\$ "
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Add MAMP mysql to PATH and PostgreSQL and RVM (for scripting)
#export PATH=$PATH:/Applications/MAMP/Library/bin:/Library/PostgreSQL/9.1/bin:$HOME/.rvm/bin

# Set TextMate as the default text editor for BASH
export EDITOR="vim"
#export EDITOR="subl -w"

export RUBYMINE_HOME="/Applications/RubyMine.app/"

# show my IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

# set some colors for the terminal
export CLICOLOR='true'

# see man ls
# The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default background for regular directories, black foreground and red background for setuid executables, etc.
export LSCOLORS="gxfxcxdxbxegedabagacad"

ca ()
{
    if [ $@ ]
    then
        WHICH_DIR=$1
    else
        clist
        read -p "____ " WHICH_DIR
    fi

    if [ $WHICH_DIR ]
    then
        if [ $WHICH_DIR != "q" ]
        then
            THE_DIR=`ls -r -1 $SHORTCUTS_PATH | head -n $((WHICH_DIR)) | tail -n 1`
            KUDA=`readlink "$SHORTCUTS_PATH/$THE_DIR"`
            echo -n "  >>>  "
            echo $KUDA
            cd "$KUDA"
        fi
    fi
}

####################################
## File listing aliases
####################################
alias ll='ls -lahF'
alias l='ls -l'
alias ls='ls -G'

alias so='source'

#alias sp40='spacey 40'
alias pre='open -a "Preview"'
alias ports='sudo lsof -i -P | grep LISTEN'


## git aliases
alias gb='go "git branch"'
alias gsb='go "git show-branch"'

alias gs='go "git status -s"'

alias gco='go "git checkout"'
alias gci='go "git commit"'
alias gpo='go "git push origin"'
alias gpm='go "git push migrator"'
alias gpl='go "git pull"'

############################################
## supporting functions
############################################
# param 1:  the command to run
# param 2:  the pattern to match for finding files to work on
findFilesApplyCommand ()
{
    # sanitize the submissions
    if [ -n "$1" -a  -n "$2" ]; then
        files=`find . -iname "*$2*"`

        fileCount=`echo "$files" | wc -l`

        # did we find any files?
        if [ $fileCount -gt 0 ]; then
            echo "-------------------------------------------"
            echo "$1"

            doForEachFile "echo '    '" "$files"

            echo "-------------------------------------------"

            doForEachFile "$1" "$files" 1
        else
            echo "No files found for   $2"
        fi

        # empty out the file list
        files=""

        # list all files' status
        gs
    else
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "    1: $1     2: $2"
        echo "    Something's empty and it ought not to be so "
        echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    fi
}


# param 1:  the command to run
# param 2:  the files to work on
# param 3:  time to sleep in the loop so we can see what's happening
doForEachFile ()
{
    if [ -n "$3" ];
    then
        sleepSeconds=$3
    else
        sleepSeconds=0
    fi

    if [ -n "$1" -a -n "$2" ];
    then
        for line in $2
        do
            if [ -f "$line" ];
            then
                sleep $sleepSeconds
                eval "$1 $line"
            fi
        done
    fi
}


## echo out the command before executing
go ()
{
	echoB $*
	eval "$*"
}

## echo out with coloring (mac)
echoB ()
{
	echo -e "\033[33m\033[44m $* \033[0m"
}

############################################
## git remote functions
############################################
alias gf='go "git fetch"'
alias gr='go "git remote"'
alias gru='go "git remote show upstream"'
alias gro='go "git remote show origin"'

############################################
## git reset shortcuts
############################################
alias grsoft='go "git reset"'
alias grhard='go "git reset --hard"'

############################################
## git merge
############################################
alias gm='go "git merge"'
alias gmupnext='go "git merge upstream/next"'
alias gmupmaster='go "git merge upstream/master"'

############################################
## git rm
############################################
alias grm='git rm'

###########################################
## git stash
###########################################
alias gst='go "git stash"'
alias gstl='go "git stash list"'
alias gstp='go "git stash pop"'

###########################################
## git fetch
###########################################
alias gf='go "git fetch"'
alias gfu='go "git fetch upstream"'

############################################
## git add
############################################
alias ga='go "git add"'
alias gau='git add -u .'
alias gai='git add -i'
gaa ()
{
    echoB "find files that match $1 and add them"
    findFilesApplyCommand "git add" "$1"
}

############################################
## git log
############################################
alias gl='go "git log"'
alias glo='go "git log --pretty=oneline"'
alias glg='go "git lgg"'
alias gls='go "git log -m --stat"'
gll ()
{
    echoB "find files that match $1 and show log for them"
    findFilesApplyCommand "git log -p" "$1"
}

############################################
## git diff
############################################
alias gd='go "git diff"'
gdd ()
{
    echoB "find files that match $1 and show log for them"
    findFilesApplyCommand "git diff" "$1"
}

############################################
## git rebase
############################################
alias grum='go "git rebase upstream/master"'

############################################
## vim
############################################

vv ()
{
    findFilesApplyCommand "vim -O" "$1"
}



############################################
## Rails shortcuts
############################################
alias rdb='go "bundle exec rake db:drop && bundle exec rake db:setup"'
