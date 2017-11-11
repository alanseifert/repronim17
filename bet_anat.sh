#!/bin/sh

for dir in female male ; do
	cd Subjects/$dir 
	sublist=`ls *.nii`
	for subj in $sublist ; do
		echo "$subj: BET"
		fslreorient2std $subj ro_$subj
		bet ro_$subj ro_${subj}_brainmask -m -R
		fslstats ro_${subj}_brainmask -V | awk '{ print $2}' >> $home/${dir}_vols.txt
	done
        cd ..
done
