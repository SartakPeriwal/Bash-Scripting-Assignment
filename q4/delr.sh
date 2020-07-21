#!/bin/bash
count=$( wc -l ~/reminder.csv | cut -f1 -d" " )
at -r "$1" 2> text.temp
flag="0"
for(( i=1;i<=count ;i++))
do  
    if [ "$1" == "$( head -"$i" ~/reminder.csv | tail -1 | cut -f2 -d ',')"  ]
    then
        (( flag++ ))
        sed -i "$i"d ~/reminder.csv
    fi
done
if [ $flag == 0 ] 
then 
    echo no such task
fi  
