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
	filesdir=$1
	searchstr=$2
fi
if [ ! -d "$filesdir" ]; then
        echo "$1 Not a valid direcotry"
	exit 1
fi

num_files=$(grep -rlc $searchstr $filesdir | wc -l)
num_lines=$(grep -roh  $searchstr $filesdir | wc -w)
echo "The number of files are $num_files and the number of matching lines are $num_lines"
exit 0
