#!/bin/bash
IFS=$'\n'
base="${HOME}/git/sites"
[ -e "${base}" ] &&
(

    for repl in $(grep replace go.mod); do
        (
            repo=${repl##*replace*github*/*/}
            repo=${repo%% =>*}
            cd "${base}/${repo}"
            echo "${repo}"
            git status -s
        )
    done
)
