#!/bin/bash

toSearch=$1

GREEN='\e[32m'
DEFAULT='\e[39m'

for i in `find -name .git`
do
  cd $i/../ > /dev/null
  result=`git grep -i "$toSearch"`
  if [ "$result" ]
  then
    echo -e "$GREEN"
    pwd
    echo -e "$DEFAULT"
    echo "$result"
  fi
  cd - > /dev/null
done
