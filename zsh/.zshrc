# zhistory settings
# Big history - larger histsize enables hist_expire_dups_first to function properly.
export HISTSIZE=10010000
export SAVEHIST=10000000

# zoptions - see https://linux.die.net/man/1/zshoptions
# inc_append_history - append entries constantly, not at close
# hist_ignore_dups - repeated dups are ignored
# hist_ignore_space - leading space means the command won't be remembered
# hist_expire_dups_first - prioritize deleting duplicates rather than old uniques
# hist_find_no_dups - ctrl-r gives uniques only
setopt inc_append_history hist_ignore_dups hist_ignore_space hist_expire_dups_first hist_find_no_dups


# aliases
alias ll='ls -la'

alias gg='git grep'
alias ggn='git grep --name-only'
alias gp='git pull'
alias gP='git push'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gap='git add --patch'
alias gcp='git checkout --patch'

# include my home bin, if I have one
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
  export PATH
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
