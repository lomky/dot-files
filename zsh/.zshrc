# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zhistory settings
# Big history - larger histsize enables hist_expire_dups_first to function properly.
export HISTFILE=~/.zsh_history
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

alias snooze='systemctl suspend'

# include my home bin, if I have one
if [ -d "$HOME/bin" ] ; then
  PATH=$PATH:$HOME/bin
  export PATH
fi

# include my home bin, if I have one
if [ -d "$HOME/.local/bin" ] ; then
  PATH=$PATH:$HOME/.local/bin
  export PATH
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ $(uname) == "Darwin" ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif command -v apt > /dev/null; then
  source ~/.powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

# Load local settings that don't need to migrate universally
if [[ -f "$HOME/.zshrc_local" ]]; then
  source ~/.zshrc_local
fi
