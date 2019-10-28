#!/bin/bash
function do_git {
    git status -s
    git tag --list | tail -n 1
    git ls-remote --tags origin  | tail -n 1    
}
. github.sh

echo "in $(pwd)"
do_git

do_site_git 

