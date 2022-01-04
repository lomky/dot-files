# .bashrc
# This file runs on every new bash instance

case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


export HISTSIZE=100000        # big big history
export HISTFILESIZE=100000    # big big history
shopt -s histappend           # append to history, don't overwrite it


# Get the bashrc git functions
if [ -f ~/.bashrc_git ]; then 
    . ~/.bashrc_git
fi

export TZ="US/Eastern"
export PS1="\[\e[32m\]\d\[\e[m\] \[\e[92m\]\t\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\] "
# Quick Ref:
# \[\e[32m\]           # Green flag
# \d                   # date
# \[\e[m\]             # White flag
# \[\e[92m\]           # Light Green flag
# \t                   # time
# \`parse_git_branch\` # git branch
# \w                   # pwd
# $ "                  # $

# Get the bash aliases
if [ -f ~/.bash_aliases ]; then 
    . ~/.bash_aliases
fi

# Load local tweaks
if [ -f ~/.bashrc_local ]; then 
    . ~/.bashrc_local
fi
