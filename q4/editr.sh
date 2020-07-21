#!/bin/bash
count=$( wc -l ~/reminder.csv | cut -f1 -d" " )
at -r "$1" 2> text.temp
flag="0"
while [ i -le count ]
do  
    if [ "$1" == "$( head -"$i" ~/reminder.csv | tail -1 | awk -F',' '{ printf $2 }')"  ]
    then
        (( flag++ ))
        sed -i "$i"d ~/reminder.csv
    fi

done    
if [ $flag == 0 ]
then 
    echo no such task
fi      
if [ -z  "$2" ] || [ -z  "$3" ] || [ -z  "$4" ];
then
    echo "Invalid entry"
    exit
fi
echo notify-sent "$4" | at "$2" "$3" 2> ~/text.temp
job_id="$( tail -1 ~/text.temp |cut -d " " -f2)"
echo $job_id
echo  "|,$job_id,|,$4,|,$2,|,$3,|" >> ~/reminder.csv
