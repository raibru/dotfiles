#!/bin/sh

DIRTY=0

while read x
do
    DIRTY=1
done

if [ ${DIRTY} -eq 1 ]
then
    cd ~/.task
    git commit -m "Hook Commit" *.data
    if ping -c1 -w3 192.168.1.18 >/dev/null 2>&1
    then
      echo "Push changes to git origin..."
#     git pull -q
#     git push -q
    else
      echo "Git origin at 192.168.1.18 not responsable"
    fi
fi

echo ${1}
