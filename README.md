# Config Git Repo

## Intro
This is a git repo meant to store my various personal config files.
Following documentation is mostly for me when I forget how to do this by the time I buy a new computer.
If you are not future me, make sure you replace the git repo urls with your own.

Idea mostly stolen from:
- *StreakyCobra*'s [comment on a Hacker News thread](https://news.ycombinator.com/item?id=11071754)
- [*durdn*'s article](https://www.atlassian.com/git/tutorials/dotfiles)

## Setup

### Step 1 - local setup
```sh
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```
- Note that the `echo` command writes to `~/.zshrc`. If you are not using zsh, this will be different.

At this point, we have initialised a bare git repo and setup up the `config` alias.
We can now use it to version any file in our `$HOME` folder:
```sh
config status
config add .zshrc
config commit -m "Added .zshrc"
config push
```

### Step 2 - remote setup

1. create a new empty repo on github (no `README.md`)
2. run:
```sh
config remote add origin https://github.com/dchae/.cfg.git
```

### Step 3 - cloning repo to new system
```sh
git clone --bare https://github.com/dchae/.cfg.git $HOME/.cfg
# restart shell
config checkout
# delete conflicting files if they exist
config config --local status.showUntrackedFiles no
```

- This assumes you are still running zsh and the aliased .zshrc is working. If not, do the alias echo from step 1 again.
