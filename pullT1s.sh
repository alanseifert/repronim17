#!/bin/bash

mkdir -p Subjects/female Subjects/male

curl “https://docs.google.com/spreadsheets/d/1C71ArMZyCN6zKsDx2V4qoTttFsguOupeFuJXxLceF3A/export?format=csv” -o RepoNimChallenge.csv -s

subtable="ReproData.csv" # INSERT CSV HERE

for (( i=2 ; i<=4 ; i++ )) ; do
	#starting at 2 to avoid header
	line=`head -n $i $subtable | tail -n 1`
	echo $line
	age=`echo $line | awk -F "," '{ print $4 }'`
	if [[ "$age" -eq 18 ]] ; then
		sex=`echo $line | awk -F "," '{ print $3 }'`
		url=`echo $line | awk -F "," '{ print $5 }'`
		url=${url%%.nii*}.nii
		filename=${url##*/}
		filename=${filename%%.nii*}.nii
		if [[ "$sex" == "F" ]] ; then
			wget -O Subjects/female/$filename $url
#			echo $sex 
#			echo $url 
#			echo $filename
#			echo ""
		else
			wget -O Subjects/male/$filename $url
#			echo $sex 
#			echo $url 
#			echo $filename
#			echo ""
		fi
	fi
done
