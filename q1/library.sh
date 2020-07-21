#!/bin/bash
if [ -e storage ]
then
    india=me
else
touch storage 
fi
if [ -e storage.txt ]
then
   jalebi=rasmalai
else
    touch storage.txt
fi

if [ -e music.txt ]
then
   gulabjalebi=ras
else
    touch music.txt
fi

if [ -e topvalue ]
then
   gulabijalebi=rasna
else
    touch topvalue
fi

echo "welcome to music library"
echo " PRESS 1 to ADD"
echo "***************"
echo "PRESS 2 TO VIEW"
echo "***************"
echo "PRESS 3 TO EDIT"
echo "***************"
echo "PRESS 4 TO DELETE"
echo "***************"
echo "PRESS 5 TO VIEW SELECT"
echo "***************"


function add(){
    echo "add called"

if [ -e music.txt ]
then hello=bye;
else
    touch music.txt
fi
    if [ "$#" -eq "2" ]; 
    then
        link="$2"
    else
        link='not given'
    fi
    term=$( cat music.txt | grep -w -c $1 ) 
    if [ "$term" -eq "0" ];
    then
        echo "${1}|${link}" >> storage
    fi
    conv
}
function conv(){
    index=1
    rm music.txt
    echo " ID ||             SONG      ||        LINK
    ----------------------------------------------------------------">music.txt
    for i in $(cat storage); do
        printf "%3d ||" $index >>music.txt
        s=$(echo $i | awk -F'|' '{ printf $1 }')
        link=$(echo $i | awk -F'|' '{ printf $2 }')
        printf "%20s   ||   " $s    >> music.txt
        echo "$link " >> music.txt
        index=$((index + 1))
    done
}
function delete(){
    echo "deletion called"
    echo

    sed "/^${1}/ d" storage > filenew  
    cat filenew > storage
    rm filenew
    conv 
}
function edit(){
rm -rf secondarstore
touch secondarstore
for i in $(cat storage); do
    a=$(echo $i | awk -F'|' '{ printf $1 }')
    l=$(echo $i | awk -F'|' '{ printf $2 }')
    if [ "$a" -eq "$1" ];
    then
        if [ "$2" -eq "1" ]
        then
            read -p "enter updated song name: " song
        else 
            song=$a
        fi
        if [ "$3" -eq "1" ]
        then 
            read -p "enter updated link: " link
        else
            link=$l
        fi
        n="${song}|${link}"
        echo $n >> secondarstore
    else
        echo $i >> secondarstore
    fi
done
cat secondarstore > storage
rm secondarstore
conv 
}
function view(){
    cat music.txt
}
function viewselect(){
    cat music.txt | head -2
    cat music.txt | grep $1
}
read task

if [ $task -eq "1" ]
then
    add $1 $2 
elif [ $task -eq  "2" ]
then 
    view

elif [ $task -eq 3 ]
then 
    edit

elif [ $task -eq 4 ]
then 
    delete

        
elif [ $task -eq 5 ]
then 
    viewselect
fi

