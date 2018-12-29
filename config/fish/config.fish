# custom
umask 022

# aliases
alias ls="exa --header"
alias rm="rm -i"
alias cls="clear"
alias ll="exa --header --long"
alias lla="exa --header --long -a"
alias tree="exa --tree"

# term
set term screen-256color


# tell grep to highlight matches
set -x GREP_OPTIONS "--color=auto"


# macos vs windows subsystem for linux
if test (uname) = "Darwin"
    # homebrew
    set -x HOMEBREW_NO_EMOJI 1
    set -x HOMEBREW_NO_ANALYTICS 1

    # node
    set -x NPM_PACKAGES "$HOME/.npm-packages"
    set -x MANPATH "$NPM_PACKAGES/share/man:(manpath)"
    set -x NODE_PATH "$NPM_PACKAGES/lib/node_modules"

    # python
    set -x PYTHONDONTWRITEBYTECODE 1

    set -x PATH $HOME/bin $HOME/miniconda3/bin /usr/local/opt/openssl/bin $NPM_PACKAGES/bin $PATH
else
    alias python="python3"
    alias pip="pip3"
    alias apt-update="sudo apt-get update; and sudo apt-get -y upgrade; and sudo apt-get clean"
end


