#!/bin/sh

DIRTY=0

#echo $@
#echo $0
#echo $1
#echo $2

while read x
do
    DIRTY=1
done

if [ ${DIRTY} -eq 1 ]
then
  tktype=`echo $2 | cut -d" " -f3`
  if [ "$tktype" = "modify" ];
  then
    tkact=`task +ACTIVE count`
    tkid=`echo $2 | cut -d" " -f2`
    tkkan=`echo $2 | cut -d" " -f4`
    if [ "$tkkan" = "kanban:inprogress" ] && [ $tkact -ne 0 ];
    then
      echo "Failure: Only one task can be active in personal kanban!"
      exit 1
    else
      echo "Accept modus kanban inprogress"
    fi
  fi
fi

echo $1

# EOF
