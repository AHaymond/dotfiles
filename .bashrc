# Check slave status on dbator
alias checkdbator="ssh dbator 'mysql -u root -p -e \"SHOW SLAVE STATUS \G\"'"

# Boxen setup
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

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

nn "DEFAULT"

# Load ANT
export ANT_HOME=/usr/local/ant
export PATH=${PATH}:${ANT_HOME}/bin
export NODE_PATH=/usr/local/lib/node_modules/


# GREP command that will search the current directory and all subfolders
alias fn='find . -type f -print0 | xargs -0 grep -sl'

# RVM Gemset aliases
alias rails328='go "ruby --version ; rails --version"'

# Alias for switching to speakez_rails development
alias speakez-rails='go "cd /Users/ode/Documents/mi/speakez-rails;"'

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
export PATH=$PATH:/Applications/MAMP/Library/bin:/Library/PostgreSQL/9.1/bin:$HOME/.rvm/bin

# Create MySQL socket for MAMP to use with RoR
alias crl="ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock"

# Add root MySQL local to path
#export PATH=$PATH:/usr/local/mysql/bin/

# Set TextMate as the default text editor for BASH
export EDITOR="vim"
#export EDITOR="subl -w"

export RUBYMINE_HOME="/Applications/RubyMine.app/"

#######################
# Go to speakez folder
#######################
alias speakez="cd ~/Documents/mi/speakez"

# go to sites folder
alias sites="cd ~/Sites"

# show my IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2"

# set some colors for the terminal
export CLICOLOR='true'

# see man ls
# The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default background for regular directories, black foreground and red background for setuid executables, etc.
export LSCOLORS="gxfxcxdxbxegedabagacad"

# export FLASHSHAREDOBJECTS='/Users/sfelt/Library/Preferences/Macromedia/Flash Player/#SharedObjects/23RE2WP6/localdev.xlontech.com'
#export FLASHSHAREDOBJECTS='/Users/sfelt/Library/Preferences/Macromedia/Flash Player/#SharedObjects/'
#alias cdso='cd "$FLASHSHAREDOBJECTS"'

# ant/ivy stuff:
# export FLEX_HOME=$HOME/opt/flex_sdk

#export TRACE='/Users/sfelt/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt'
#export FMM='/Library/Application Support/Macromedia/mm.cfg'

#export FPHOME='/Library/Internet Plug-Ins/Flash Player.plugin'
export SVN_MERGE='vim'

#export PATH=/Applications/calibre.app/Contents/MacOS:~/bin:/opt/local/bin:/opt/local/sbin:$PATH:/Applications/OpenOffice.org.app/Contents/MacOS:/Applications/eclipse:/Applications/ImageMagick-6.6.7/bin:/Users/sfelt/d/sandbox/gae/appengine-java-sdk-1.4.3/bin:/Applications/MAMP/bin:/Applications/MAMP/Library/bin

#spacey ()
#{
#    SPACECOUNT=$1
#
#    OUTSPACE=""
#    OUTLINE=""
#
#    while [ $SPACECOUNT -gt 0 ]
#        do
#            OUTSPACE="$OUTSPACE\n"
#            OUTLINE="$OUTLINE-"
#            SPACECOUNT=$((SPACECOUNT - 1))
#        done
#
#    echo -e $OUTSPACE
#    echo $OUTLINE
#    echo -e $OUTSPACE
#}

#SHORTCUTS_PATH=~/Documents/shortcuts/cl

#cm ()
#{
#    ln -s "`pwd`" $SHORTCUTS_PATH
#}
#
#clist ()
#{
    ## ls -l $SHORTCUTS_PATH | cat -n
#    ls -r -l $SHORTCUTS_PATH | cut -c 45- | \
#    sed 's/\/Users\/sfelt\/d\/hm\/Jarvis\/branches/~~bran~/' | \
#    sed 's/\/Users\/sfelt\/d\/hm\/Jarvis\/trunk/~~trun~/' | \
#    sed 's/\/Users\/sfelt/~/' | \
#    sed 's/-> \\*//' | \
#    sed 's/ /__space__/g' | \
#    sed 's/__space__/ /' | \
#    awk 'NF!=0{print $0}' | awk '{ printf "%-20s %s\n", $1, $2}'  | \
#    sed 's/__space__/ /g' | \
#    cat -n

    ## awk 'NF!=0{print $0}' | awk '{ printf "%70s\n", $0 }'  | cat -n
#}

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

tarbak ()
{
    FILE=$1
    TOTAR=`echo $FILE | sed -e "s#/\\$##" | sed -e "s#/#.#g"`
    #if [ $@ -a -e $TOTAR ]
    tar -czvf ~/TRASH/$TOTAR.`date +%Y%m%d_%H%M_%S`.tgz $FILE
}

####################################
## File listing aliases
####################################
alias ll='ls -lahF'
alias l='ls -l'
alias ls='ls -G'

# mysql (MAMP) shortcuts
alias m='mysql -uroot -proot speakez'
alias trace='tail -n100 -f "$TRACE"'
alias ctrace='echo "" > "$TRACE";spacey 40;tail -f "$TRACE"'
# alias vtrace='v "$TRACE"'

# flex compiler
# alias fc='mxmlc -compiler.library-path+="/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.utils/libs/corelib-0.9.swc" -compiler.source-path="/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.core/src,/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.modules.reporting/src,/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.modules.useradmin/src,/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.utils/src,/Users/sfelt/Documents/Flex Builder 3/flightaf/src,/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.portal/src,/Users/sfelt/Documents/Flex Builder 3/com.movenetworks.mms.thirdparty.flexlib/src" -output "/Users/sfelt/TRASH/fc.out.swf"'


alias so='source'

#alias sp40='spacey 40'
alias pre='open -a "Preview"'
alias oo='open -a "OpenOffice.org.app"'
#export ANT_HOME=/usr/share/java/ant-1.7.1/
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
#export PATH=$PATH:/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/bin:/usr/share/java/ant-1.7.1/bin:/Users/sfelt/Documents/sandbox/nook/android-sdk-mac_x86/platform-tools

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
