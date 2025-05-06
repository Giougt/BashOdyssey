#!/bin/bash 
#this script illustrates the use of test as a condition 

# display each command 
set -x

echo $0
echo $1

usage() {
  echo "Usage: $0 <directory>"
  echo "creates a directory ..."
}

if [ $# -ne 1 ] ; then 
  echo "Incorrect number of arguments"
  usage 
  exit 1
fi 

if [ -d $1 ] ; then 
  uname 
  whoami
  date
else 
  mkdir $1
  echo "created $1"
fi

#sucess
exit 0
