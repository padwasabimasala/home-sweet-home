# ENV ------------------------------------------------------------------------------------------------------
export TERM=xterm-256color
export EDITOR=vim
export PATH=".:./bin:~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"
export CDPATH=".:..:~/:~/src"
export PYTHONPATH=".:..:$PYTHONPATH"
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# http://www.catonmat.net/blog/the-definitive-guide-to-bash-command-line-history/
# make bash ignore duplicate commands, commands that begin with a space, and the ‘exit’ command.
export HISTIGNORE="&:[ ]*:exit"

# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# posterity demmands a long history ;) cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30 
export HISTFILESIZE=100000000
export HISTSIZE=100000000

# append to history file, don't overwrite
shopt -s histappend 

# Whenever displaying prompt, write last line to disk
PROMPT_COMMAND="history -a" 

source ~/.titlebar
source ~/.dircolors
source ~/.rake-completion.bash

__source_if() {
	if [ -e $1 ]; then
		source $1
	fi 
}

__path_if() {
	if [ -e $1 ]; then
		export PATH=$PATH:$1
	fi 
}

__source_if .octannerrc
__source_if ~/.nvm/nvm.sh
__source_if /usr/local/etc/bash_completion
__source_if ~/.nvm/nvm.sh

__path_if /usr/local/heroku/bin
  
eval "$(rbenv init -)"

# GIT  ------------------------------------------------------------------------------------------------------
# Git completion, aliases, and prompt func
# http://www.simplicidade.org/notes/archives/2008/02/git_bash_comple.html
# http://benmabey.com/2008/05/07/git-bash-completion-git-aliases.html

source ~/.git-completion.bash
complete -o default -o nospace -F _git g # ~/bin/g

alias gc="git checkout "
complete -o default -o nospace -F _git_checkout gc

alias gx='git merge'
complete -o default -o nospace -F _git_merge gx

alias gz='git rebase'
complete -o default -o nospace -F _git_rebase gz

alias gs='git status'
alias gp='git pull'
alias gn='git clone'
alias gd="git d"
alias gcb='git checkout -b'
alias gm='git checkout master'

gfzm ()
{
  local branch=$(git branch |grep \* |cut -d\* -f2)
  git fetch && git rebase origin/master && git checkout $branch
}

# ALias City ------------------------------------------------------------------------------------------------------
alias rcedit='vi ~/.bashrc'
alias rccommit='git add ~/.bashrc; git commit ~/.bashrc'
alias rcdiff="git diff HEAD ~/.bashrc"
alias rcreload="source ~/.bashrc"
alias vimrcedit="vi ~/.vimrc"

alias l="ls -G"
alias d="rm -rf"
alias c="cp -r"
alias k=rake

alias ls="ls -G "
alias ll="ls -h -G -l "
alias lla="ls -h -G -Al "
alias la="ls -G -A "
alias lt="ls -h  -G -lt "
alias ltr="ls -h  -G -ltr "

alias ..="cd .."
alias ...="cd ../.."
alias cd..="cd .."

alias cp='cp -r '
alias scp='scp -r '
alias rm="rm -f "

alias du="du -hsc " # disk usage: hunman readable, summary, one file system, total
alias df="df -h " # df (mounts) human readable

alias lsx="ls -al -G |grep " 
alias igrep='grep -i '
alias psgrep="echo 'try psx'"
alias psx="ps aux|grep "
alias chmox="chmod +x"

alias mget='wget -r -k -t45 -l2 -o log '

alias ka=/usr/bin/killall
alias killall='echo Try ka'
alias k9="kill -9 "
alias ka9="killall -9 "
alias psme='ps aux|grep `whoami`'
alias clear="clear;echo [0m;"

alias tf='tail -f '
alias bi='bundle install'
alias print='lp -o cpi=14 -o lpi=10'
alias wl='wc -l'
alias h1='head -n1'
alias h10='head -n10'

alias jcurl='curl -H "Accept: application/json" -H "Content-type: application/json"'

function pidx() {
  ps aux |grep "$@" |grep -v grep |awk '{print $2}'
}

oct-api-curl () {
  resource=$1
  shift
  jcurl -H "Authorization: Token token=$(grep api.octanner.com ~/.auth| cut -d' ' -f2)" https://api.octanner.com/$resource $@
}

if [[ $(which src-hilite-lesspipe.sh) ]]; then alias cat="src-hilite-lesspipe.sh"; fi

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

function heroku-psql {
  bash -c "$(heroku config -a $1 |grep DATABASE_URL |ruby -e 'STDIN.first =~ %r(DATA.*://(\w+):(\w+)@(.+):(\d+)/(\w+)); puts "PGPASSWORD=#{$2} psql -h #{$3} -U #{$1} -p #{$4} #{$5}"')"
}

# Hrrrm this is getting overridden by something above so I moved it to the bottom
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
