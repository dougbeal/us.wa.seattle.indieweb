#!/bin/bas
IFS=$'\n'
(
    for repl in $(grep replace go.mod); do
        repo=${repl##replace }
        repo=${repo%% =>*}
        cd ~/git
        git clone "https://${repo}"
    done
)
