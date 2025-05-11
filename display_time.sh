#!/bin/bash

# stock time 
time=$ (date +%T)
# stock time UTC +1
time1=$(date +%T -d "+1 hour")
# display date 
date=$(date)
# add one day 
date_oneday=$(date -d "1 day")
# display only second time
time_second=$(date +%s)
# try use python module time 
python3 <<EOF 
import time 
from time import perf_counter_ns
# time in second
print(time.time(),"time in second from python3")
# var time start
time_start = perf_counter_ns()
# test
print("this is a test")
time_end = perf_counter_ns()
# delay command print
diff_time = time_end-time_start
print("Delay of print is",diff_time,"in python")
EOF 

# Delay of command echo in bash
time_start=$(date +%N)
echo "This is a test"
time_end=$(date +%N)
diff_time=$(($time_end-$time_start))
diff_time_second=$(awk "BEGIN {printf \"%.10\", $diff_time / 1000000000}")
echo "$diff_time_second"s" Delay of echo from shell script"

# display time 
echo $time
echo $time1
echo $date 
echo $date_oneday
echo $time_second "seconds since January 1, 1970"

# manipulate date
New_date=$(date -d "+9 days")
echo $New_date
# same but shorter
date -d "Sat May 09 22:38:45 CEST 2025+9 days"
# other format result="20250518"
new_date_value=`date '+%C%y%m%d' -d "$end_date+9 days"`
echo $new_date_value

# compare date
date1=$(date +%Y%m%d")
date2=$(date -d 2025-03-13 +"%Y%m%d")
if [ $date1 = $date2 ]
# or if [ $date1 == $date2 ]
then
  echo "This is the same date"
else 
  echo "This is note the same date"
fi
# >
if [ $date1 -gt $date2 ]
then
  echo "Date1 is greater than Date2"
else 
  echo "Date1 is not greater than Date2"
fi
# <
if [ $date1 -lt $date2 ]
then
  echo "Date1 is lower than Date2"
else
  echo "Date1 is not lower than Date2"
fi

# loop for generate date between start and end
start="2025-12-11"
end="2025-12-15"
start=$(date -d "$start" +%Y%m%d)
end=$(date -d "$end" +%Y%m%d)
while [[ $start -le $end ]]
do  
  echo $start
  start=$(date -d"$start + 1 day" +"%Y%m%d")
done

# convert int in date 
read -p "enter number second:" date_int
date -d "@$date_int" +"%Y-%m-%d"

# determine if the day is in weekend
read -p "enter a date" date_var
day_date=$(date -d "$date_var" +%u)
# check if the day is a weekend 
if [ "$day_date" -eq 6 ] || [ "$day_date" -eq 7 ]; then 
# if [[ $(date -d "$day_date" +%u) -gt 5 ]]; then 
  echo "the date is a weekend."
else
  echo "the date is not a weekend."
fi 
