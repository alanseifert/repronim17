#!/bin/bash

mkdir -p Subjects/female Subjects/male

subtable="ReproData.csv" # INSERT CSV HERE

for (( i=2 ; i<=4 ; i++ )) ; do
	#starting at 2 to avoid header
	line=`head -n $i $subtable | tail -n 1`
	age=cat $line | awk -F "," '{ print $4 }' $subtable
	if [[ "$age" -eq 18 ]] ; then
		sex=cat $line | awk -F "," '{ print $3 }'
		url=cat $line | awk -F "," '{ print $5 }'
		filename=${url##*/}
		if [[ "$sex" == "F" ]] ; then
			curl -o Subjects/female/$filename
		else
			curl -o Subjects/male/$filename
		fi
	fi
done
