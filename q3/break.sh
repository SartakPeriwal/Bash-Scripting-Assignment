i=1
if test "$1" = ""
then echo "NO INPUT"
    exit 
fi
for ((j=0;j<$1;j++))
do
    echo "#$i work time "
#    notify-send "work time"
    sleep 1500
    if [ ! `expr $i % 4` -eq 0 ]
    then
    echo "#$i short break time"
#  notify-send "short break  time"
    sleep 300
    elif [ `expr $i % 4` -eq 0 ]
    then
        echo "#$i long break time"
#        notify-send "long break time"
        sleep 900
    fi
    i=`expr $i + 1`
done
