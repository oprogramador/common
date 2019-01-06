#!/bin/bash
set -e

RED='\033[0;31m'
NC='\033[0m'

for repo in `find -name .git`
do
    printf "\n\n\n"
    echo $repo
    cd $repo/../
    pwd
    ls -la
    (
        git add . &&
        git stash &&
        git checkout master &&
        git fetch --all &&
        git merge origin/master --no-edit
    ) ||
    echo -e "${RED}an issue in $repo${NC}"
    cd -
done
