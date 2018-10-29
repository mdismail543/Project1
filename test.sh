#!/bin/bash
#Author : Mohammad Ismail
#Email: mdismail543@gmail.com
#it will get the required data and dump into CSV files 
for file in *.log; do
 
grep "ERROR" $file>$file.gr
cat $file.gr|awk -F, '{print $1}'|awk '{print $2}' | awk -F: '{print "A"$1*60+$2"A"}' >  $file.txt
 
for i in $(seq 1 1439); do
 
res=`grep A${i}A ${file}.txt|wc -l`
echo $i , $res >> error_per_min_$file.csv
done
 
for i in $(seq 0 23); do
sum=0
for j in $(seq 0 59); do
((time = $i*60+$j))
res=`grep A${time}A ${file}.txt|wc -l`
((sum=$sum+$res))
done
echo $i , $sum>> error_per_hour_$file.csv
done
 
done
cat out.log|awk -F, '{print $1}'|tr -d '[]' |sed -e "s/.846066//"|awk '{print $2,"," $5 }'  > test5.txt
grep -v "up" test5.txt | tr -d 'ms' > test5.csv
