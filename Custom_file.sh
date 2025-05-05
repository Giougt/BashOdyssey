#!/bin/bash
# create a file txt
touch test.txt
#complete the file 
echo "hello world" > test.txt
# permission execute
chmod +x Custom_file.sh
# open the file
pluma test.txt
# wait 3 seconds 
sleep 3
# close the file 
exec 3>test.txt
