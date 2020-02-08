#!/bin/bash
set -e

export RED_FOREGROUND="\033[0;31m"
export DEFAULT_FOREGROUND="\033[0;39m"

set +e
curl "https://api.github.com/users/oprogramador/repos?per_page=1000" | python -c 'import sys, json; map(lambda x: sys.stdout.write(x["clone_url"] + "\n"), json.load(sys.stdin))' | xargs -L1 git clone
set -e

for repo in `find . -name .git`
do
  printf "\n\n\n"
  echo $repo
  cd $repo/../
  git clean -nf
  if [ "`git remote -v`" ]; then
    git add .
    git stash
    git checkout master
    git pull origin master
    git push origin master || echo -e "${RED_FOREGROUND}push failed${DEFAULT_FOREGROUND}"
  fi
  cd -
done
