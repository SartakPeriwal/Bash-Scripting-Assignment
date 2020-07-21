#!/bin/bash
line=$(cat $1 | wc -l )
cd $2
mkdir BAD
mkdir AVERAGE
mkdir GOOD
mkdir AWESOME
cd ~-
for (( j=1;j<=$line;++j ))
do

    stars=$( cat $1 | cut -d$'\n' -f $j | cut -d ':' -f 2 )
    movie=$( cat $1 | cut -d$'\n' -f $j | cut -d ':' -f 1 )
    if [[ ${stars%%.*} -lt 5 && ${stars%%.*} -gt 0 ]]
    then
        touch $2/BAD/$movie.mp4
    elif [[ ${stars%%.*} -ge 5 && ${stars%%.*} -lt 8 ]]
    then 
        touch $2/AVERAGE/$movie.mp4

    elif [[ ${stars%%.*} -ge 8 && ${stars%%.*} -lt 9 ]]
    then 
        touch $2/GOOD/$movie.mp4

    elif [[ ${stars%%.*} -ge 9 && ${stars%%.*} -le 10 ]]
    then 
        touch $2/AWESOME/$movie.mp4

    fi

done




