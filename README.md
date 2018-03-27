# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc  

## Clone to expected location

`git clone https://github.com/lomky/dot-files.git ~/.dot-files`  

## Structure

### Bash Files

**.bash_profile** - _aka run-at-login_  

UI machines:  
`ln -s ~/.dot-files/.bash_profile_base ~/.bash_profile_base`  
`ln -s ~/.dot-files/.bash_profile_local ~/.bash_profile`  

terminal machines:  
`ln -s ~/.dot-files/.bash_profile_base ~/.bash_profile_base`  
`ln -s ~/.dot-files/.bash_profile_remote ~/.bash_profile`  

Machine specific overrides should be placed in file `~/.bash_profile_tweaks`

**.bashrc** - _aka run on any terminal launch_  

All machines:  
`ln -s ~/.dot-files/.bashrc ~/`  
`ln -s ~/.dot-files/.bashrc_git ~/`  

Machine specific overrides should go in file `~/.bashrc_tweaks`  

**.bash_aliases**  

All machines:  
`ln -s ~/.dot-files/.bash_aliases ~/`  

Machine specific overrides should go in file `~/.bash_aliases_tweaks`  

### Vim files

`cd`  
`ln -s ~/.dot-files/.vim .`  
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
`ln -s ~/.dot-files/.vimrc .`  
`vim +PluginInstall +qall`  

TODO: local overrides  
Unclear where there should go, given Vundles locale requirements.  
One for vundle, one for other?  

### Screen file

`cd`  
`ln -s ~/.dot-files/.screenrc .`  

Machine specific overrides should go in file `~/.screenrc_tweaks`  

### User-level Git ignore

Unix machines:  
`cd`  
`git config --global core.excludesfile ~/.gitignore`  
`ln -s ~/.dot-files/.gitignore-nix`

### Git aliases

Pretty, dense log:  
`hist = log --graph --full-history --all --pretty=format:'%Cred%h%Creset %ad %s %C(green)%d%Creset %C(bold blue)<%an>%Creset' --date=short`  
Delete all branches merged into master (except `master` & `development`)  
`cleanup = "!git checkout master && git branch --merged | grep  -v '\\*\\|master\\|development' | xargs -r -n 1 git branch -d && git checkout -"`  

### Ask Git to stash my credentials

Unix machines:  
`git config --global credential.helper cache`  
`git config --global credential.helper 'cache --timeout=3600'`  

Mac:  
`git credential-osxkeychain`  
`git config --global credential.helper osxkeychain`  

### Improve the quality of fortunes

Unix machines:  
`cd /usr/share/games/fortune`
`sudo tar xzvf ~/.dot-files/fortune_collection.tar.gz`  

