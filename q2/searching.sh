#!/bin/bash
#sudo apt install curl  #remove comments
if test  "$1" = "" 
then 
    echo "NO INPUT_1"
fi
if test "$2" = ""
then
    echo "NO INPUT_2"
fi


if [ "$#" -ne 2 ]; then
    echo "total parameters not correct";
else
    echo "$1 "
    wget -q -O t.txt $2
    sed -n "/<body/,/<\/body>/p" t.txt > t
    sed -e "s/<[^>]*>//g" t > t.txt
    cat t.txt | grep -c "$1"

fi

