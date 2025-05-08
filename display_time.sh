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
