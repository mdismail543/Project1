#!/bin/bash
#Author : Mohammad Ismail
#Email: mdismail543@gmail.com
#it will get the required data and dump into CSV files  and write into a log when conditon fails
for a in out.log; do
gawk '$5 > 100 { print $1, $5 }' $a > $a.tr
cat $a.tr |tr -d '[]' |sed -e "s/.846066//"| grep -v "up" | tr -d 'ms'  > 1_$a.txt
cat 1_$a.txt | awk -F, '{print "Rsponce Time high at " $1 , $2}' > responce_$a.log
done 

for file in *.log; do
 
grep "ERROR" $file>$file.gr
cat $file.gr|awk -F, '{print $1}'|awk '{print $2}' | awk -F: '{print "A"$1*60+$2"A"}' >  $file.txt
 
for i in $(seq 1 1439); do
 
res=`grep A${i}A ${file}.txt|wc -l`
echo $i , $res >> ops1_per_min_out.log.csv

done
done
IFS=","
while read tm er
do
    if [ $er -ge 5 ]
 then
  h=$(($tm / 60))
  m=$(($h / 60))
 echo " Error at $h:$m is high $er" >> 2.log
 else
  continue;
  fi
       
done < ops1_per_min_out.log.csv
