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
alias ci="code-insiders"

# gpg
set -gx GPG_TTY (tty)

# macos vs windows subsystem for linux
if test (uname) = "Darwin"

    # starship
    starship init fish | source
    # homebrew
    set -gx HOMEBREW_NO_EMOJI 1
    set -gx HOMEBREW_NO_ANALYTICS 1

    # node
    # set -gx NPM_PACKAGES "$HOME/.npm-packages"
    # set -gx MANPATH "$NPM_PACKAGES/share/man:(manpath)"
    # set -gx NODE_PATH "$NPM_PACKAGES/lib/node_modules"

    # python
    set -gx PYTHONDONTWRITEBYTECODE 1

    # dotnet
    set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
    # set -gx MONO_PATH "/Library/Frameworks/Mono.framework/Versions/Current/bin"

    # path
    # set -gx PATH $HOME/bin $HOME/miniconda3/bin /usr/local/opt/openssl/bin $NPM_PACKAGES/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $MONO_PATH $PATH
    set -gx PATH $HOME/bin $HOME/miniconda3/bin /usr/local/opt/openssl/bin $HOME/.local/bin $HOME/.cargo/bin $HOME/.dotnet/tools $PATH  # commented out by conda initialize  # commented out by conda initialize

else
    # alias
    alias python="python3"
    alias pip="pip3"
    alias apt-update="sudo apt-get update; and sudo apt-get -y upgrade; and sudo apt-get clean"

end

# bootstrap fisher and process fisher file
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/calex/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

