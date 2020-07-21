#!/bin/bash
if [ -z  "$1" ]
then
    sort -t"," -k6 ~/reminder.csv |column -t -s,
    exit
fi

if [ "$1" -eq "date" ]
then
    sort -t"," -k8 ~/reminder.csv |column -t -s,
    exit
fi

if [ "$1" -eq "body" ]
then
    sort -t"," -k4 ~/reminder.csv |column -t -s,
    exit
fi
