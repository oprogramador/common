#!/bin/bash
set -e

export RED_FOREGROUND="\033[0;31m"
export DEFAULT_FOREGROUND="\033[0;39m"

set +e
curl "https://api.github.com/users/oprogramador/repos?per_page=100&page=1" | python2 -c 'import sys, json; map(lambda x: sys.stdout.write(x["clone_url"] + "\n"), json.load(sys.stdin))' | xargs -L1 git clone
curl "https://api.github.com/users/oprogramador/repos?per_page=100&page=2" | python2 -c 'import sys, json; map(lambda x: sys.stdout.write(x["clone_url"] + "\n"), json.load(sys.stdin))' | xargs -L1 git clone
curl "https://api.github.com/users/oprogramador/repos?per_page=100&page=3" | python2 -c 'import sys, json; map(lambda x: sys.stdout.write(x["clone_url"] + "\n"), json.load(sys.stdin))' | xargs -L1 git clone
archive=repo-archive_`date +'%Y-%m-%d_%H-%M-%S'`
mkdir ~/Downloads/$archive
mv all-the-cities ~/Downloads/$archive
mv cities1000 ~/Downloads/$archive
mv date-holidays ~/Downloads/$archive
mv lodash.getPath ~/Downloads/$archive
mv moment-timezone ~/Downloads/$archive
mv putout ~/Downloads/$archive
mv react-carousel ~/Downloads/$archive
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
    git checkout master || git checkout main
    git pull origin master || git pull origin main
    git push origin master || git push origin main || echo -e "${RED_FOREGROUND}push failed${DEFAULT_FOREGROUND}"
  fi
  cd -
done
