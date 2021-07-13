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
export PS1="\[\e[32m\]\d\[\e[m\] \[\e[92m\]\t\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\] "
# \[\e[32m\]                                                       # Green flag
# \d                                                               # date
# \[\e[m\]                                                         # White flag
# \[\e[92m\]                                                       # Light Green flag
# \t                                                               # time
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # Green flag
# \`parse_git_branch\`                                             # git branch
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # White flag
# \w                                                               # pwd
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # Green flag
# $ "                                                              # $
# \[\e[m\]                                                         # White flag

# Pride prompt
#export PS1="🌈 \[\e[91m\]\d\[\e[m\] \[\e[93m\]\t\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[94m\]\w\[\e[m\] \[\e[95m\]\\$\[\e[m\] "
#  🌈                                                              # pride
# \[\e[92m\]                                                       # Light Green flag
# \t                                                               # time
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # Green flag
# \`parse_git_branch\`                                             # git branch
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # White flag
# \w                                                               # pwd
# \[\e[m\]                                                         # White flag
# \[\e[32m\]                                                       # Green flag
# $ "                                                              # $
# \[\e[m\]                                                         # White flag

# Get the bash aliases
if [ -f ~/.bash_aliases ]; then 
    . ~/.bash_aliases
fi

# Get the bash local configs
if [ -f ~/.bashrc_local ]; then 
    . ~/.bashrc_local
fi

xsetroot -solid "#0f440f"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
