#!/bin/bash
# Bash completion support for Rake, Ruby Make.
# https://github.com/ai/rake-completion/blob/master/rake

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    if [ -f Rakefile ]; then
        recent=`ls -t .rake_tasks~ Rakefile **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --prereqs | grep "rake" | cut -d " " -f 2 > .rake_tasks~
        fi
        COMPREPLY=($(compgen -W "`cat .rake_tasks~`" -- ${COMP_WORDS[COMP_CWORD]}))
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake
