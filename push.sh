#!/bin/bash
. github.sh
do_site_git push --follow-tags -u origin master
do_site_git push --tags -u origin master
