# fisher
set -g fisher_path ~/.config/fish

set fish_function_path $fish_function_path $fisher_path/functions
set fish_complete_path $fish_complete_path $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

# custom
umask 022

# aliases
alias rm="rm -i"
alias cls="clear"
alias ll="ls -l"
alias lla="ls -la"
alias lla="ls -la"
alias python="python3"
alias pip="pip3"
alias apt-update="sudo apt-get update; and sudo apt-get -y upgrade; and sudo apt-get clean"

# term
set term screen-256color
