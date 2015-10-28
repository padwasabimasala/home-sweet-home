# ENV ------------------------------------------------------------------------------------------------------
export TERM=xterm-256color
export EDITOR=vim
export CDPATH="./:~/src"
export PATH=".:./bin:~/bin:./var:$GOPATH/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin"
# History configuration
# http://www.catonmat.net/blog/the-definitive-guide-to-bash-command-line-history/
# http://www.oreillynet.com/onlamp/blog/2007/01/whats_in_your_bash_history.html
# http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
shopt -s histappend
export HISTIGNORE="&:[ ]*:exit" # ignore dups, commands with leading space, and exit
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth # dupes and leading space
export HISTTIMEFORMAT="%F %T " # Timestamp history
# -a Append the new history lines (history lines entered since the beginning of the current Bash session) to the history file.
# -c Clear the history list. This may be combined with the other options to replace the history list completely.
# -r Read the current history file and append its contents to the history list.
# -n (sync history of other shells)  Append the history lines not already read from the history file to the current history list. These are lines appended to the history file since the beginning of the current Bash session.
export PROMPT_COMMAND="history -a; history -c; history -r"
export PYTHONPATH=".:..:$PYTHONPATH"
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export AUTH_FILE=~/.auth
export GOPATH=~/src/go

source ~/.titlebar
source ~/.dircolors

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

__source_if ~/.rake-completion.bash
__source_if ~/.npm-completion.bash
#__source_if /usr/local/share/bash-completion/bash_completion - something broke this :/
__source_if ~/.nvm/nvm.sh
__source_if ~/.env
__source_if ~/.ntpapirc
__source_if ~/.octanner

__path_if ~/vendor/activate-1.2.3
__path_if ~/vendor/play-2.2.1
__path_if /usr/local/heroku/bin

eval "$(rbenv init -)"

function v() {
  vim -o"$#" "$@"
}
# GIT Topia  ------------------------------------------------------------------------------------------------------
# Git completion, aliases, and prompt func
# http://www.simplicidade.org/notes/archives/2008/02/git_bash_comple.html
# http://benmabey.com/2008/05/07/git-bash-completion-git-aliases.html

source ~/.git-completion.bash
complete -o default -o nospace -F _git g # ~/bin/g

alias gb='git branch'
complete -o default -o nospace -F _git_branch gb

alias gbd='git branch -D'
complete -o default -o nospace -F _git_branch gbd

alias gcm="git cm "
complete -o default -o nospace -F _git_commit gcm

alias gco="git co "
complete -o default -o nospace -F _git_checkout gco

alias gp='git push'
complete -o default -o nospace -F _git_push gp

alias gx='git merge'
complete -o default -o nospace -F _git_merge gx

alias gz='git rebase'
complete -o default -o nospace -F _git_rebase gz

alias gdl='git dl'
alias gdc='git dc'
alias gcam='git cam'
alias gcb='git checkout -b'
alias gm='git checkout master'
alias grhm='git rh && git checkout master'
alias gn='git clone'
alias gd="git d"
alias gl="git l"
alias gll="git ll"
alias gza='git rebase --abort'
alias gs='git status'
alias gp='git push'
alias gphm='git push heroku master'
alias gpom='git push origin master'
alias gppm='git push prod master'
alias gpl='git pull'

gfzm ()
{
  local branch=$(git branch |grep \* |cut -d\* -f2)
  git fetch && git rebase origin/master && git checkout $branch
}

# Ruby land
alias Rc="rails c"
alias Rs="rails s"
alias b=bundle
alias be="bundle exec"
alias bek="bundle exec rake"
alias bekdm="bundle exec rake db:migrate"
alias ber="bundle exec rails"
alias berc="bundle exec rails c"
alias bers="bundle exec rails s"
alias bes="bundle exec rspec"
alias bi='bundle install'
alias irb=pry
alias k=rake
alias s=rspec

# Alias City ------------------------------------------------------------------------------------------------------
alias rcedit='vi ~/.bashrc'
alias rccommit='cd /opt/dotfiles/repo; git add bashrc; git commit bashrc; cd -'
alias rcdiff="cd /opt/dotfiles/repo; git diff HEAD ~/.bashrc"
alias rcreload="source ~/.bashrc"
alias vimrc="vi ~/.vimrc"
alias gitrc="vi ~/.gitconfig"
alias history-sync="history -n"
alias history-report="cut -f1,2 -d\" \" ~/.bash_history | sort | uniq -c | sort -nr | head -n 30"

alias c=cd
complete -o default -o nospace -F _cd c
alias d="rm -rf"
alias L=less
alias a=activator

alias l="ls -oaG"
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

alias lsx="ls -al -G |grep -i"
alias igrep='grep -i '
alias envx="env |grep -i"
alias chmox="chmod +x"

alias mget='wget -r -k -t45 -l2 -o log '

alias ka=/usr/bin/killall
alias killall='echo Try ka'
alias k9="kill -9 "
alias ka9="killall -9 "
alias psx="ps aux|grep -i"
alias psme='ps aux|grep `whoami`'
alias clear="clear;echo [0m;"

alias tf='tail -f '
alias print='lp -o cpi=14 -o lpi=10'
alias wl='wc -l'
alias h1='head -n1'
alias h10='head -n10'

if [[ $(which src-hilite-lesspipe.sh) ]]; then alias cat="src-hilite-lesspipe.sh"; fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Functions

function last-migration() {
  vim db/migrate/$(ls db/migrate/ |tail -n1)
}

function pidx() {
  ps aux |grep "$@" |grep -v grep |awk '{print $2}'
}

function killx() {
  pidx "$@" |xargs kill
}

jcurl() {
  curl_cmd="curl -H \"Accept: application/json\" -H \"Content-type: application/json\" $@"
  if test -n "$DEBUG"; then
    echo "Running: $curl_cmd"
  fi
  eval "$curl_cmd"
}

h() {
  if test $# -eq 0; then
    heroku
  else
    firstArg=$1
    shift
    if test ${#firstArg} -eq 1; then
      echo $firstArg
      for remote in $(git remotes |cut -f1 |uniq); do
        echo $remote
        if test $firstArg = ${remote:0:1}; then
          echo ${remote:0:1}
          echo heroku $remote $@ --account work
        fi
      done
      echo 1
    fi
    heroku $@ --account work
  fi
}


heroku-db() {
  app=$1
  url=$(heroku config -a "$app" |grep DATABASE_URL)
  conf=$(expr "$url" : ".*postgres://\(.*\)")

  echo conf : $conf

  user=$(expr "$conf" : "^\([^:]*\):")

  echo user : $user

  pass=$(expr "$conf" : "^.*:\([^@]*\)@")

  echo pass : $pass

  host=$(expr "$conf" : "^.*@\([^:]*\):")

  echo host : $host

  port=$(expr "$conf" : "^.*:\([0-9]*\)/")

  echo port : $port

  name=$(expr "$conf" : "^.*[0-9]/\(.*\)")

  echo name : $name
}

function goog {
  url="http://www.google.com/search?hl=en&source=hp&q=$@&aq=f&aqi=g5&aql=&oq="
  w3m "$url"
}

function app {
  open -a /Applications/$1.app $2 #http://www.hccp.org/command-line-os-x.html
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

function tarq {
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

bhg () { # Grep Bash History
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

function watch() {
  if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: watch 'cmd' [path]" 1>&2
    return 1
  fi

  cmd="$1"
  path="."
  if [[ $# -eq 2 ]]; then
    path=$2
  fi
  fswatch -o $path |xargs -n1 -I{} $cmd
}




# Remove log, tmp, bak files
function cleanup {
  rm *.log *.tmp *.bak
  find ./ -name '.**.swp' -exec rm {} +
  find ./ -name '.**.swo' -exec rm {} +
}

function newterm {
  nohup gnome-terminal --hide-menubar 2>&1>/dev/null
}

# http://machine-cycle.blogspot.com/2007/10/syntax-highlighting-pager.html
if [[ -s /usr/share/vim/vim73/macros/less.sh ]]; then
  - () {
   /usr/share/vim/vim73/macros/less.sh "$*"
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
  local app=$1
  echo "Connecting to app $1"
  shift
  local cmd="$(heroku config -a $app |grep DATABASE_URL |ruby -e 'STDIN.first =~ %r(DATA.*://(\w+):(\w+)@(.+):(\d+)/(\w+)); puts "PGPASSWORD=#{$2} psql -h #{$3} -U #{$1} -p #{$4} EXTRA_ARGS #{$5}"')"
  bash -c "${cmd/EXTRA_ARGS/$@}"
  #bash -c "$(heroku config -a $app |grep DATABASE_URL |ruby -e 'STDIN.first =~ %r(DATA.*://(\w+):(\w+)@(.+):(\d+)/(\w+)); puts "PGPASSWORD=#{$2} psql -h #{$3} -U #{$1} -p #{$4} $@ #{$5}"')"
}

function auth {
  grep $1 $AUTH_FILE
}

function clone {
  if [ $# -eq 2 ]; then
    local org=$1
    local repo=$2
  elif [ $# -eq 1 ]; then
    local org=octanner
    local repo=$1
  else
    echo "Usage: clone [org] repo" >&2
    return 1
  fi

  cd ~/src
  git clone git@github.com:$org/$repo.git
  cd $2
}

function clone-heroku {
  if [ $# -eq 1 ]; then
    local app=$1
  else
    echo "Usage: clone-heroku app" >&2
    return 1
  fi

  cd ~/src
  git clone git@heroku.work:$app.git
  cd $app
}

function todo {
  open https://gist.github.com/padwasabimasala/af14263ddd15b74c1397
}

# http://mac-user-blog.blogspot.com/2012/08/enabling-ftp-on-with-mountain-lion.html
ftp-on() {
  sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist
}

ftp-off() {
  sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist
}

eccTopicSearch() {
  ref ecc |cut -d' ' -f5- |tr ' ' '\n' |sed 's/[,\.";?]//g' | tr [:upper:] [:lower:] |sed -E 's/^(and|the|to|is|of|a|in|i|that|not|who|he|for|his|all|man|it|has|will|are|your|be|with|him|you|what|than|there|my|but|also|have|this|one|no|they|from|them|or|was|after|do|on|does|so|an|And|as|better|done|before|by|many|nor)$//g' |sort  |uniq -c |sort -nr |head -n25
}

__prompt_leader() {
  printf "\033[;${PROMPT_COLOR}m${PROMPT_CHAR} \033[0m"
}

__set_prompt_char_and_color() {
  local last_retval="$?"
  __rotate_prompt_color
  __set_prompt_char $last_retval
}

__rotate_prompt_color() { # Color rotation credit https://bbs.archlinux.org/viewtopic.php?id=109234
  local colors=("0;30" "1;30" "0;37" "1;37" "1;36" "0;36" "1;32" "0;32" "0;34" "1;34" "0;35" "1;35" "1;31" "0;31" "0;33" "1;33")
  PROMPT_COLOR=${colors[$((++PROMPT_COLOR_IDX % 16))]}
}

__set_prompt_char() {
  local last_retval=$1
  PROMPT_CHAR="✧"
  if test $last_retval != 0; then
    PROMPT_CHAR="-!-"
    PROMPT_COLOR="0;31"
  fi
}

__prompt_git_info()
{
  local b="$(git reflog 2> /dev/null |grep checkout: |head -n1 |awk '{print $8}' 2> /dev/null)"
  local local_changes="$(git diff --numstat 2> /dev/null |wc -l)"
  local cached_changes="$(git diff --cached --numstat 2> /dev/null |wc -l)"
  local color="0;32m"

  if test $local_changes != 0 || test $cached_changes != 0; then
    color="1;33m"
  fi

  if test $local_changes != 0 && test $cached_changes != 0; then
    color="1;31m"
  fi

  if [ -n "$b" ]; then
    printf " (\033[$color$b\033[0m)"
  fi
}
#
# To test CouchDB run:
#     curl http://127.0.0.1:5984/
#
# The reply should look like:
#     {"couchdb":"Welcome","uuid":"....","version":"1.6.1","vendor":{"version":"1.6.1-1","name":"Homebrew"}}
#
# To have launchd start couchdb at login:
#     ln -sfv /usr/local/opt/couchdb/*.plist ~/Library/LaunchAgents
# Then to load couchdb now:
#     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.couchdb.plist
# Or, if you don't want/need launchctl, you can just run:
#     couchdb

# export PROMPT_COMMAND="__set_prompt_char_and_color; $PROMPT_COMMAND"
# export PS1='\[$(__prompt_leader)\]\u@\h \W$(__prompt_git_info) '
export PATH=$PATH:~/src/ci-shortcut
export PATH=$PATH:/Users/matthew.thorley/src/perfect/bin
alias p='source /Users/matthew.thorley/src/perfect/bin/perfect'

export PATH=/Users/matthew.thorley/erl/otp_src_17.4/bin:$PATH
export PATH=/Users/matthew.thorley/erl/elixir/bin:$PATH
