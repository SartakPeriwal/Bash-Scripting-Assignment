#!/bin/bash
if [ -e ~/reminder.csv ]
then
    hey="a"
else
    touch ~/reminder.csv
fi
if [ -z  "$1" ] || [ -z  "$2" ] || [ -z  "$3" ];
then
    echo "Invalid entry"
    exit
fi
echo notify-send "$3" | at "$1" "$2" 2> ~/text.temp
job_id="$( tail -1 ~/text.temp |cut -d " " -f2)"
echo $job_id
echo  "|,$job_id,|,$3,|,$1,|,$2,|" >> ~/reminder.csv
