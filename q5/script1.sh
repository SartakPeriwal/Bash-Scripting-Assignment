#!/bin/bash
line=$(ls -l | wc -l)
for (( i=2;i<="$line";++i ))
do
        file_name[$i]=$(ls -lt | cut -d$'\n' -f $i | rev | awk ' {{ print $1 }} ' | rev)
        file_date[$i]=$(stat ${file_name[$i]} | grep 'Modify' | awk ' {{ print $2 }}')
        file_time[$i]=$(stat ${file_name[$i]} | grep 'Modify' | awk ' {{ print $3 }}'  | cut -f 1 -d '.')
done

for (( i=2;i<="$line";++i ))
do
    echo "${file_date[$i]} ${file_time[$i]} ${file_name[$i]}"
done
touch 2018101024.txt
man -k lo | grep ^lo > 2018101024.txt
echo NUMBER OF LINES : $(cat 2018101024.txt |wc -l)
line=$(cat 2018101024.txt |wc -l)
maximum=0
for (( t=1;t<=line;++t ))
do
    #   echo "a"
    word=$( cat 2018101024.txt | cut -d$'\n' -f $i)
    len=${#word}
    if [ $len -ge $maximum ]
    then
#         echo "b"
        maximum=$len
    fi
done
echo 
echo "Length of longest : $maximum"
cp 2018101024.txt ./backup.txt
sed -i "s/function/method/g" ./2018101024.txt
