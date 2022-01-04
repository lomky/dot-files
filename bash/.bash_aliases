# Better ls'
alias ll='ls -lat'

# Clean that prompt up
alias dirtrim_1='export PROMPT_DIRTRIM=1'
alias dirtrim_2='export PROMPT_DIRTRIM=2'
alias dirtrim_3='export PROMPT_DIRTRIM=3'

# Quick git commands
alias gg='git grep'
alias ggn='git grep --name-only'
alias gp='git pull'
alias gP='git push'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gap='git add --patch'
alias gcp='git checkout --patch'

# Install thefuck everywhere
eval $(thefuck --alias fuck)
alias please='fuck'

#local tweaks
# Get the bash aliases
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
