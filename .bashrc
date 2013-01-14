if [ -f /etc/bash/bashrc ]; then
    source /etc/bash/bashrc
fi 
source ~/.titlebar
source ~/.dircolors
source ~/.grep_exclude

# http://www.catonmat.net/blog/the-definitive-guide-to-bash-command-line-history/
# make bash ignore duplicate commands, commands that begin with a space, and the ‘exit’ command.
export HISTIGNORE="&:[ ]*:exit"

# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# posterity demmands a long history ;) cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30 
export HISTFILESIZE=100000000
export HISTSIZE=100000000
shopt -s histappend # append to history file, don't overwrite
PROMPT_COMMAND="history -a" # Whenever displaying prompt, write last line to disk

export EDITOR=vim
export PATH=".:..:~/bin/:~/.util/:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/opt/local/sbin:$PATH:/sbin/:/usr/sbin/:~/.gem/ruby/1.8/bin"
export CDPATH=".:..:~/:~/src"
export MANPATH=/usr/local/git/man:$MANPATH
export PYTHONPATH=".:..:$PYTHONPATH"
export PYTHONSTARTUP="$HOME/.pythonrc.py"

set -o vi # set vi command editing mode

# http://www.simplicidade.org/notes/archives/2008/02/git_bash_comple.html
source ~/.git-completion.bash
source ~/.rake-completion.bash

__my_git_ps1 ()
{ 
  local b="$(git reflog 2> /dev/null |grep checkout: |head -n1 |awk '{print $8}' 2> /dev/null)"
  if [ -n "$b" ]; then
    printf " ($b)"
  fi
}

PS1='\u@\h \W$(__my_git_ps1)'
case 'id -u' in
  0) PS1="${PS1}# ";;
  *) PS1="${PS1}$ ";;
esac
export PS1

# http://benmabey.com/2008/05/07/git-bash-completion-git-aliases.html

alias gco='git checkout'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git checkout master'
alias gp='git pull'

complete -o default -o nospace -F _git_checkout gco

# Bash completion on macs with ports installed
if [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi
if [ -e /opt/local/bin/python2.5 ]; then
  alias python="/opt/local/bin/python2.5"
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Aliases 
alias rcedit='vi ~/.bashrc'
alias rccommit='git add ~/.bashrc; git commit ~/.bashrc'
alias rcdiff="git diff HEAD ~/.bashrc"
alias rcreload="source ~/.bashrc"
alias vimrcedit="vi ~/.vimrc"

# Good old fasion laziness
alias l="ls -G"
alias v=vi
alias d="rm -rf"
alias c="cp -r"

alias ls="ls -G "
alias ll="ls -h -G -l "
alias lla="ls -h -G -Al "
alias la="ls -G -A "
alias lt="ls -h  -G -lt "
alias ltr="ls -h  -G -ltr "
alias lsgrep="ls -al --color |grep " 

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

alias cp='cp -r '
alias scp='scp -r '
alias rm="rm -f "
alias del="rm -Rf "
alias at=/usr/bin/autotest

alias du="du -hsc " # disk usage: hunman readable, summary, one file system, total
alias df="df -h " # df (mounts) human readable

alias mgrep='grep -A2 -B2 -n --color'
alias igrep='grep -i '
alias rbgrep="grep --include='*.rb' --color"

alias mget='wget -r -k -t45 -l2 -o log '

alias ka=/usr/bin/killall
alias killall='echo Try ka'
alias k9="kill -9 "
alias ka9="killall -9 "
alias psgrep="ps aux|grep "
alias psme='ps aux|grep `whoami`'
alias clear="clear;echo [0m;"

alias tf='tail -f '
alias bi='bundle install'
alias print='lp -o cpi=14 -o lpi=10'
alias wl='wc -l'
alias h1='head -n1'
alias h10='head -n10'

if [[ $(which ipython) ]]; then alias ipy=ipython; fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Functions
function goog {
  url="http://www.google.com/search?hl=en&source=hp&q=$@&aq=f&aqi=g5&aql=&oq="
  w3m "$url"
}

function app {
  #http://www.hccp.org/command-line-os-x.html
  open -a /Applications/$1.app $2
}

function prepend {
  mv $1 "$2$1"
}

function _mv {
  mv $1 _$1
}

function _cp {
  cp $1 _$1
}


function mcd {
  mkdir $1; cd $1
}

# TODO This would be better if the new file retained the extention
# e.g. somefile.py would become somefile-date.py
function backmv
{
	useage="Use: backmv [file...] [destination]"
	if [[ $# < 2 ]];then
		echo $useage
	else
		# Sort the files from the destination
		files=''
		dest=''
		i=1
		for op in $@;do
			if [[ $i < $# ]];then
				files=$files" $op"
			else
				dest=$op
			fi
			i=$(( $i+1 ))
		done
		
		# Get the date to append to the file
		date=$(date +"%Y%m%d")
		
		# Copy the files
		for file in $files; do
			# Get the last portion of the file as filename
			filename=$(echo $file| awk '{z=split($1, arr, "/"); print arr[z]}')
			mv  $file $dest/$filename-$date
		done
	fi
}

function qtar {
  tar czf "$1.tgz" $1
}

extract () {
   if [ -f $1 ] ; then
     case $1 in
       *.tar.bz2)   tar xvjf $1  ;;
       *.tar.gz)  tar xvzf $1  ;;
       *.bz2)     bunzip2 $1   ;;
       *.rar)     unrar x $1     ;;
       *.gz)    gunzip $1    ;;
       *.tar)     tar xvf $1   ;;
       *.tbz2)    tar xvjf $1  ;;
       *.tgz)     tar xvzf $1  ;;
       *.zip)     unzip $1     ;;
       *.Z)     uncompress $1  ;;
       *.7z)    7z x $1    ;;
       *)       echo "don't know how to extract '$1'..." ;;
     esac
   else
     echo "'$1' is not a valid file!"
  fi
}

filter () {
   PTRN=$1
   shift
   ARGC=$#

   CMD="grep $PTRN --color=always -R ."
   i=1
   while [ $i -le $ARGC ]; do
     CMD="$CMD |grep -v ${!i}"
     i=$((i+1))
   done
   CMD="$CMD |grep $PTRN |less -R"
   eval $CMD
}

hg () { # Grep Bash History
  grep $@ ~/.bash_history
}
   
function findreplace {
  usage="findreplace findstr replacestr file [file...]" 
  if [ $# -lt 2 ]; then
    echo $usage
    return 1
  fi
  which perl > /dev/null
  if [ $? -ne 0 ]; then
    echo "perl not available"
    return 1
  fi
  findstr=$1
  replacestr=$2
  shift 2
  perl -p -i -e "s/$findstr/$replacestr/g" $@
}

function watch_processes {
  if [ -e $1 ]; then
    echo "Usage: $0 <process matching string>"
    exit 1
  fi
  watch "ps aux | grep $1 |grep -v grep"
}
alias wp="watch_processes"


# Remove log, tmp, bak files
function cleanup {
  rm *.log *.tmp *.bak
  if [[ $1 == "-A" ]]; then
    rm *.swp *.swo
  fi
}

# Open a new terminal (gnome)
function newterm {
  nohup gnome-terminal --hide-menubar 2>&1>/dev/null
}
alias nt=newterm


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Host specific settings
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

function mb_logins
{
  alias api='ssh root@api'

  user=mrt

  for i in admin micro; do 
    alias $i="ssh $user@${i}"
  done

  alias mon="ssh mrt@monitor"
  alias www="ssh developer@www.globalbased.com"
  alias db="ssh root@db"

  for i in $(seq -w 1 12); do
    alias d$i="ssh $user@drone$i.miningbased.com"
  done

  for i in `seq -w 01 07`; do 
    alias m$i="ssh $user@micro$i.miningbased.com"
  done

  for i in 01 02; do 
    alias q$i="ssh $user@queue$i.miningbased.com"
  done
}

if [[ `hostname` == mrt ]]; then
  export REPO=http://svn.miningbased.com/svn/
  export hive=$REPO/hive
  mb_logins
fi

if ! test -z $(which gnome-open); then 
  alias open=gnome-open
fi

# http://machine-cycle.blogspot.com/2007/10/syntax-highlighting-pager.html
if [[ -s /usr/share/vim/vim72/macros/less.sh ]]; then 
  - () {
   /usr/share/vim/vim72/macros/less.sh "$*"
  }
fi

function q {
  USER=$(grep ono-leads-db1 ~/.authinfo| awk '{print $2}') 
  PASS=$(grep ono-leads-db1 ~/.authinfo| awk '{print $3}') 
  HOST=$(grep ono-leads-db1 ~/.authinfo| awk '{print $4}') 
  DB=$(grep ono-leads-db1 ~/.authinfo| awk '{print $5}') 
  SQL="$@"
  mysql -h$HOST -u$USER -p$PASS $DB -B -e "$SQL" # -B is tabdelim
}

function qsh {
  USER=$(grep ono-leads-db1 ~/.authinfo| awk '{print $2}') 
  PASS=$(grep ono-leads-db1 ~/.authinfo| awk '{print $3}') 
  HOST=$(grep ono-leads-db1 ~/.authinfo| awk '{print $4}') 
  DB=$(grep ono-leads-db1 ~/.authinfo| awk '{print $5}') 
  SQL="$@"
  mysql -h$HOST -u$USER -p$PASS $DB
}

function q2 {
  USER=$(grep ono-leads-db2 ~/.authinfo| awk '{print $2}') 
  PASS=$(grep ono-leads-db2 ~/.authinfo| awk '{print $3}') 
  HOST=$(grep ono-leads-db2 ~/.authinfo| awk '{print $4}') 
  DB=$(grep ono-leads-db2 ~/.authinfo| awk '{print $5}') 
  SQL="$@"
  mysql -h$HOST -u$USER -p$PASS $DB -e "$SQL"
}

function qadmin {
  USER=$(grep ono-leads-admin ~/.authinfo| awk '{print $2}') 
  PASS=$(grep ono-leads-admin ~/.authinfo| awk '{print $3}') 
  HOST=$(grep ono-leads-admin ~/.authinfo| awk '{print $4}') 
  DB=$(grep ono-leads-admin ~/.authinfo| awk '{print $5}') 
  SQL="$@"
  mysql -h$HOST -u$USER -p$PASS $DB -e "$SQL"
}

function cq {
  USER=$(grep classesa-ready-db ~/.authinfo| awk '{print $2}') 
  PASS=$(grep classesa-ready-db ~/.authinfo| awk '{print $3}') 
  HOST=$(grep classesa-ready-db ~/.authinfo| awk '{print $4}') 
  DB=$(grep classesa-ready-db ~/.authinfo| awk '{print $5}') 
  SQL="$@"
  mysql -h$HOST -u$USER -p$PASS $DB -e "$SQL"
}
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:/usr/local/oracle/instantclient_10_2:$DYLD_LIBRARY_PATH;
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/Applications/grails-2.0.4/bin
# For oracle insta-client and oci8
# http://blog.rayapps.com/2008/04/24/how-to-setup-ruby-and-new-oracle-instant-client-on-leopard/
export SQLPATH="/usr/local/oracle/instantclient_10_2"
export TNS_ADMIN="/usr/local/oracle/network/admin"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=$PATH:$DYLD_LIBRARY_PATH

# function oracle2 {
#   USER=$(grep contract_development ~/.authinfo| awk '{print $2}') 
#   PASS=$(grep contract_development ~/.authinfo| awk '{print $3}') 
#   HOST=$(grep contract_development ~/.authinfo| awk '{print $4}') 
#     DB=$(grep contract_development ~/.authinfo| awk '{print $5}') 
#   HIST=~/.sqlplus_history
#   touch $HIST
#   rlwrap -i -f $HIST -H $HIST -s 30000 /usr/local/oracle/instantclient_10_2/sqlplus $USER/$PASS@"(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=$HOST)(PORT=1521)))(CONNECT_DATA=(SID=$HOST)))"
# }

# Set up RVM 
[[ -s "/Users/mthorley/.rvm/scripts/rvm" ]] && source "/Users/mthorley/.rvm/scripts/rvm" 

alias lpip="ssh leads-prod-intake-portal"
alias lpiv="ssh leads-prod-intake-vendor"
alias lpic="ssh leads-prod-intake-call"
alias optm="ssh optometry"
alias nb="ssh neckbeard"

set_term_bgcolor(){
  local R=$1
  local G=$2
  local B=$3
  /usr/bin/osascript <<EOF
tell application "iTerm"
  tell the current terminal
    tell the current session
      set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
    end tell
  end tell
end tell
EOF
}


# NOTES
# Prevent ssh host key checking by appending the line below to .ssh/config
#   StrictHostKeyChecking no 

# NVM setup 
source ~/.nvm/nvm.sh
# RVM setup
source ~/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
