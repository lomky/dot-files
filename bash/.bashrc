# If not running interactively, don't do anything
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

# Get the bashrc git functions
if [ -f ~/.bashrc_git ]; then 
    . ~/.bashrc_git
fi

export TZ="US/Eastern"
export PS1="\[\e[32m\]\d\[\e[m\] \[\e[32m\]\t\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\]\w \\$ "

# Get the bash aliases
if [ -f ~/.bash_aliases ]; then 
    . ~/.bash_aliases
fi

# Add machine specific tweaks here after creating a local machine branch

# Get the bash local
if [ -f ~/.bashrc_local ]; then 
    . ~/.bashrc_local
fi

