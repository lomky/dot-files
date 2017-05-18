
alias ll='ls -lat'
alias ltr='ls -latr'
alias dirtrim_1='export PROMPT_DIRTRIM=1'
alias dirtrim_2='export PROMPT_DIRTRIM=2'
alias dirtrim_3='export PROMPT_DIRTRIM=3'

#local tweaks

# Get the overrides
if [ -f ~/.bash_aliases_tweak ]; then 
    . ~/.bash_aliases_tweak
fi

