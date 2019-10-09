#!/bin/bash
IFS=$'\n'
base="${HOME}/git/sites"
mkdir -p "${base}" &&
(

    for repl in $(grep replace go.mod); do
        (
            repo=${repl##replace }
            repo=${repo%% =>*}
            cd "${base}"
            git clone "https://${repo}"
        )
    done
)
