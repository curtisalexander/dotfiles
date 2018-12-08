###########
## zplug ##
###########

export ZPLUG_HOME="/usr/local/opt/zplug"
source "${ZPLUG_HOME}/init.zsh"

# plugins
zplug "zplug/zplug"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# zplug load --verbose

# let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


#########
## zsh ##
#########

# history
HISTFILE=~/.zsh_history
SAVEHIST=1000000
HISTSIZE=100000


##############
## env vars ##
##############

# color ls
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# homebrew
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ANALYTICS=1

# node
export NPM_PACKAGES="${HOME}/.npm-packages"
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"
export NODE_PATH="${NPM_PACKAGES}/lib/node_modules"

# PowerShell
export PSHOME="/usr/local/microsoft/powershell/6.0.2"

# Elixir
# iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# CC
export CC="/usr/bin/clang"

# Python
export PYTHONDONTWRITEBYTECODE="1"
# export PIPENV_VENV_IN_PROJECT="1"

# mono
export MONO_GAC_PREFIX="/usr/local"

# PATH
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/miniconda3/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/openssl/bin:${NPM_PACKAGES}/bin:${PATH}"
# export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/opt/openssl/bin:${HOME}/miniconda3/bin:/usr/local/bin:/usr/local/sbin:${NPM_PACKAGES}/bin:${PATH}"


###########
## alias ##
###########

alias ls="ls -G"
alias rm="rm -i"
alias cls="clear; ls"
alias cl="clear"
alias ag-fzf="ag --nobreak --nonumbers --noheading . | fzf"
# brew install rmtrash
alias del="rmtrash"
alias nv="nvim"
alias postgres.server="pgsql-server ${1}"
alias rig="radon --install ${1} -g"


###########
## files ##
###########

ulimit -S -n 2048


############
## pipenv ##
############

eval "$(pipenv --completion)"


###########
## conda ##
###########



#########
## fzf ##
#########

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


###################
## haskell stack ##
###################

# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# eval "$(stack --bash-completion-script stack)"


###############
## functions ##
###############

function ag-ext() {
    ag -g ".\.${1}" -i
}

function pgsql-server() {
    case $1 in
        "start")
            echo "Trying to start PostgreSQL...";
            pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start ;;
        "stop")
            echo "Trying to stop PostgreSQL...";
            pg_ctl -D /usr/local/var/postgres stop -s -m fast ;;
    esac
};

fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//' )
}

