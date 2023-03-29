#!/bin/sh

if [ $# -lt 1 ]
then
	echo "No arguments"
	exit 1

elif [ $# -lt 2 ]
then
	echo "Not enough arguments"
	exit 1
else
	writefile=$1
	writestr=$2
fi
if [ ! -d "$(dirname "${writefile}")" ]
then 
        mkdir -p $(dirname "${writefile}") 
fi
echo "$writestr" > $writefile
if [ $? -ne 0 ]
then 
	echo "error: unable to write to file"
        exit 1 
fi

exit 0
