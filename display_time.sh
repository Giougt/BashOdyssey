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
print(time.time(),"time in second from python3")

EOF 

# display time 
echo $time
echo $time1
echo $date 
echo $date_oneday
echo $time_second "seconds since January 1, 1970"
