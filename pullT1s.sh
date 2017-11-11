#!/bin/bash

# make subject directories
mkdir -p Subjects/female Subjects/male

# grab the CSV file from google
curl “https://docs.google.com/spreadsheets/d/1C71ArMZyCN6zKsDx2V4qoTttFsguOupeFuJXxLceF3A/export?format=csv” -o ReproNimChallenge.csv -s
subtable="ReproDataChallenge.csv"
n=`cat $subtable | wc -l`

# loop through subjects, skipping first line header
for (( i=2 ; i<=n ; i++ )) ; do
	# pull out each line
	line=`head -n $i $subtable | tail -n 1`
#	echo $line
	# parse age; arbitrarily only grabbing 18 year olds
	age=`echo $line | awk -F "," '{ print $4 }'`
	if [[ "$age" -eq 18 ]] ; then
		# parse sex, URL, and filename for 18 year old subjects
		sex=`echo $line | awk -F "," '{ print $3 }'`
		url=`echo $line | awk -F "," '{ print $5 }'`
		# the CSV has weird endline characters, deleting the ends and replacing as a workaround
		url=${url%%.nii*}.nii
		filename=${url##*/}
		filename=${filename%%.nii*}.nii
		# grab the files and save them to the appropriate directories
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
