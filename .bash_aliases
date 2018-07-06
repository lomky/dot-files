
alias ll='ls -lat'
alias ltr='ls -latr'
alias lsd='ls -l | grep ^d'
alias lsl='ll -l | grep ^l'
alias la='ls -A'
alias l='ls -CF'
alias dirtrim_1='export PROMPT_DIRTRIM=1'
alias dirtrim_2='export PROMPT_DIRTRIM=2'
alias dirtrim_3='export PROMPT_DIRTRIM=3'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


#local tweaks

# Local overrides go here after creating a machine-specific branch
