#!/bin/bash

mkdir -p Subjects/female Subjects/male

subtable="" # INSERT CSV HERE

for (( i=2 ; i<=31 ; i++ )) ; do
	#starting at 2 to avoid header
	line=`head -n $i subtable | tail -n 1`
	age=cat $line | awk '{ print $4 }'
	if [[ "$age" -eq 18 ]] ; then
		sex=cat $line | awk '{ print $3 }'
		url=cat $line | awk '{ print $5 }'
		filename=${url##*/}
		if [[ "$sex" == "F" ]] ; then
			curl -o Subjects/female/$filename
		else
			curl -o Subjects/male/$filename
		fi
	fi
done
