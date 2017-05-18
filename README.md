# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc

## Structure

### Bash Files

**.bash_profile** - _aka run-at-login_

UI machines:  
`ln -s ~/repo/dot-files/.bash_profile_base ~/.bash_profile_base`
`ln -s ~/repo/dot-files/.bash_profile_local ~/.bash_profile`

terminal machines:  
`ln -s ~/repo/dot-files/.bash_profile_base ~/.bash_profile_base`
`ln -s ~/repo/dot-files/.bash_profile_remote ~/.bash_profile`

Machine specific overrides should be placed in file `~/.bash_profile_tweaks`

**.bashrc** - _aka run on any terminal launch_

All machines:  
`ln -s ~/repo/dot-files/.bashrc ~/`  
`ln -s ~/repo/dot-files/.bashrc_git ~/`

Machine specific overrides should go in file `~/.bashrc_tweaks`

**.bash_aliases** 

All machines:  
`ln -s ~/repo/dot-files/.bash_aliases ~/`  

Machine specific overrides should go in file `~/.bash_aliases_tweaks`
