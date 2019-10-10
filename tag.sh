#!/bin/bash
IFS=$'\n'
base="${HOME}/git/sites"
tag=$( git tag | tail -n 1 )
[ -e "${base}" ] &&
(

    for repl in $(grep replace go.mod); do
        (
            repo=${repl##*replace*github*/*/}
            repo=${repo%% =>*}
            cd "${base}/${repo}"
            echo "${repo}"
            git tag ${tag}
        )
    done
)
