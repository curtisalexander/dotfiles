# fisher
set -g fisher_path ~/.config/fish

set fish_function_path $fish_function_path $fisher_path/functions
set fish_complete_path $fish_complete_path $fisher_path/completions

for file in $fisher_path/conf.d/*.fish
    builtin source $file 2> /dev/null
end

# custom
umask 022

alias rm="rm -i"
alias cls="clear"

# term
set term screen-256color
