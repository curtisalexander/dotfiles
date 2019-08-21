# custom
umask 022

# aliases
alias ls="exa --header"
alias rm="rm -i"
alias cls="clear"
alias ll="exa --header --long"
alias lla="exa --header --long -a"
alias tree="exa --tree"
alias grep="grep --color=auto"

# macos vs windows subsystem for linux
if test (uname) = "Darwin"
    
    # homebrew
    set -gx HOMEBREW_NO_EMOJI 1
    set -gx HOMEBREW_NO_ANALYTICS 1

    # node
    set -gx NPM_PACKAGES "$HOME/.npm-packages"
    set -gx MANPATH "$NPM_PACKAGES/share/man:(manpath)"
    set -gx NODE_PATH "$NPM_PACKAGES/lib/node_modules"

    # python
    set -gx PYTHONDONTWRITEBYTECODE 1

    # dotnet
    set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
    # path
    set -gx PATH $HOME/bin $HOME/miniconda3/bin /usr/local/opt/openssl/bin $NPM_PACKAGES/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $PATH

else
    # alias
    alias python="python3"
    alias pip="pip3"
    alias apt-update="sudo apt-get update; and sudo apt-get -y upgrade; and sudo apt-get clean"
end
