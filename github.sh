#!/bin/bash
IFS=$'\n'
base="${HOME}/git/sites"
function do_site_git  {
    [ -e "${base}" ] &&
        (
            git status -s
            for repl in $(grep "replace.*github" go.mod); do
                (
                    repo=${repl##*replace*github*/*/}
                    repo=${repo%% =>*}
                    cd "${base}/${repo}"
                    echo "in ${repo}"
                    git $@
                )
            done
        )
}
