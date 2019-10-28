#!/bin/bash
. github.sh
tag=$( git tag | tail -n 1 )
do_site_git tag ${tag}
