# dot-files
Convenient backup of all my commonly used unix dot files, configurations, etc

## Installs

### Linux

The dotfiles:
```bash
sudo apt install stow
# in this repo:
stow -v --ignore='manual' --ignore='inactive' --ignore='README.md' --ignore='LICENSE' .
```

Apps:
```bash
sudo add-apt-repository ppa:regolith-linux/stable
sudo apt update
sudo apt install vim keepassxc curl rbenv
```

### OSX
I once again find myself having to work on a ~~broken unix system~~ Mac. Alas.

```bash
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install rbenv powerlevel10k git

#install nvm
# NB: go get the real line from https://github.com/nvm-sh/nvm#install--update-script because they hardcode version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#install homebrew's huge-version vim
brew install vim
```

## Config

### Git
#### Set Git configs

Set editor, user, and email. In this house we use `main`

```bash
git config --global core.editor "vim"
git config --global user.name "Kat Tipton"
git config --global init.defaultBranch main
git config --global core.excludesfile ~/.gitignore
git config --global user.email ""
```

Set aliases for a nice history log and to cleanup local merged branches

```bash
git config --global alias.hist "log --graph --full-history --all --no-merges --pretty=format:'%Cred%h%Creset %ad %s %C(green)%d%Creset %C(bold blue)<%an>%Creset' --date=short"
git config --global alias.co checkout
```

#### Ask Git to stash my credentials

Unix machines:

```bash
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
```

Mac:

```bash
git config --global credential.helper osxkeychain
```

### Firefox profile styling

First, install [Tree Style Tab](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/) and [TST More Tree Commands](https://addons.mozilla.org/en-US/firefox/addon/tst-more-tree-commands/), and move the sidebar to the right.

To activate custom css, open Firefox & load `about:config`, set
`toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

Open `about:profiles` and copy the root profile directory

```bash
PROFILE_DIR=""
mkdir $PROFILE_DIR/chrome
ln -s ~/.dot-files/manual/firefox/userChrome-nix.css $PROFILE_DIR/chrome/userChrome.css
```

### Font

**Linux**
```bash
git clone https://github.com/rubjo/victor-mono ~/.victor-mono
mkdir ~/tmp ~/tmp/VM ~/.local/share/fonts/
cd ~/tmp/VM && unzip ~/.victor-mono/public/VictorMonoAll.zip && cd
mv ~/tmp/VM/TTF ~/.local/share/fonts/VictorMono
rm -rf ~/tmp/VM
fc-cache -f -v
```

**Mac**
```bash
brew install --cask font-victor-mono
```

# Version

2.0.0

## Version History
#### 2.0.0 - 2025-06
Move to use Stow
#### 1.8.2 - 2023-04
Add firefox details
Better vim and font installation for mac
#### 1.8.1 - 2023-03
Making the swap to zsh
Setting Mac stuff back up
Minor vimrc tweaks
#### 1.7.0 - 2022-01
basic settings for bash, screen, & git cleanup
abandon long disused variants
readme formatting cleanup
#### 1.6.0 - 2021-11
rewrite vimrc
beta background script
#### 1.5.1 - 2021-07
i3-gaps
Added todo
#### 1.5.0 - 2021-07
Add i3wm
#### 1.4.1 - 2021-06
Fix font config, typos
#### 1.4.0 - 2021-06
Added font config
#### 1.3.0 - 2021-03
Setup installs section
#### 1.2.1 - 2021-01
New git config to prefer `main`
#### 1.2.0 - 2021-01
Add Firefox userChrome.css. Fully nuke fortune.
#### 1.1.2 - 2020-08
Fix README formatting, new git alias
#### 1.1.1 - 2019-11
Remove fortune stuff
#### 1.1.0 - 2019-10
Prefer `_local` to branching. If it's good enough to commit, it's probably worth having on other machines.
#### 1.0.0 - 2019-03
Began tracking version

# TODO

_Nothing pending_
