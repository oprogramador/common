#!/bin/bash
set -e

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

for repo in `find -name .git`
do
    printf "\n\n\n"
    echo $repo
    cd $repo/../
    if [[ ! -z `git remote -v | head -1` ]]
    then
        git add .
        git stash
        git checkout master
        git fetch --all
        if [[ -z `git remote -v | grep '^origin\s'` ]] && [[ ! -z `git remote -v | grep '^heroku\s' | head -1` ]]
        then
            git merge heroku/master --no-edit
        else
            git merge origin/master --no-edit
        fi
    else
        echo -e "${YELLOW}no remote for $repo${NC}"
    fi
    cd -
done
