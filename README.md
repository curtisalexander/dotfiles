# dotfiles

My dotfiles are managed with [rcm](https://github.com/thoughtbot/rcm).  The [thoughtbot](https://thoughtbot.com/) blog post for `rcm` is [here](https://robots.thoughtbot.com/rcm-for-rc-files-in-dotfiles-repos).


## Getting Started

### Get `rcm`

Instructions from the `rcm` [README](https://github.com/thoughtbot/rcm).

#### macOS

```sh
# install rcm
brew tap thoughtbot/formulae
brew install rcm
```

#### Ubuntu (Windows Subsystem for Linux)

```sh
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm
```

### Get dotfiles

Now that I have `rcm`, clone my dotfiles.

```sh
git clone https://github.com/curtisalexander/dotfiles.git ~/code/dotfiles
```

### Setup dotfiles

After cloning, run the appropriate install script depending upon whether running on MacOS or Ubuntu.

```sh
cd bin

# macos
install-dotfiles-macos

# ubuntu
install-dotfiles-ubuntu
```

The last step in each of the scripts above is to run `rcup`.  This will create symlinks from `~/.dotfiles` to your home directory.

Anytime that `rcup` is run &mdash; whether it is after the initial setup or after a regular update &mdash; the script `hooks/post-up` is run.

To create a symlink from `~/.dotfiles` to your home directory run the following.

```sh
rcup -v
```

### Add a new dotfile

Add a new rc file to the `~/.dotfiles` directory.

```sh
mkrc ~/.netrc
```

After adding to the `~/.dotfiles` directory, create the appropriate symlink.

```sh
rcup -v
```
