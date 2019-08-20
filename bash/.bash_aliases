# Better ls'
alias ll='ls -lat'
alias ltr='ls -latr'
alias lsd='ls -l | grep ^d'
alias lsl='ll -l | grep ^l'
alias la='ls -A'
alias l='ls -CF'

# Clean that prompt up
alias dirtrim_1='export PROMPT_DIRTRIM=1'
alias dirtrim_2='export PROMPT_DIRTRIM=2'
alias dirtrim_3='export PROMPT_DIRTRIM=3'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Delete local branches whose remote tracking branch is gone
# Required to clean up squashed merged branches :(
alias gitclean="git fetch -p && for branch in "`git branch -vv | awk '{print $1,$4}' | grep 'gone]' | awk '{print $1}'`"; do git branch -D \"$branch\"; done"

# Run rubocop in autofix mode
alias rcfix='rubocop -a'

# All the bundles
alias be='bundle exec'
alias bet='bundle exec rspec'
alias betv='bundle exec rspec --format documentation'
alias ber='bundle exec rails'

# Quick git commands
alias gg='git grep'
alias gp='git pull'
alias gP='git push'
alias gb='git blame'
alias gd='git diff'

# Install thefuck everywhere
eval $(thefuck --alias fuck)

#local tweaks
# Get the bash aliases
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
