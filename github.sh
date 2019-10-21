#!/bin/bash
IFS=$'\n'
base="${HOME}/git/sites"
declare -F "do_git" &>/dev/null
if [ $? -ne 0 ]; then
    function do_git {
        echo -n '\t'
        git $@
    }
fi

function do_site_git  {
    [ -e "${base}" ] &&
        (
            for repl in $(grep "replace.*github" go.mod); do
                (
                    repo=${repl##*replace*github*/*/}
                    repo=${repo%% =>*}
                    cd "${base}/${repo}"
                    echo "in ${repo}"
                    do_git $@
                )
            done
        )
}
