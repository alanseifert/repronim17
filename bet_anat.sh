#!/bin/sh

BASE_DIR=
subj_list="subjects"

for subj in ${subj_list}; do
	cd $BASE_DIR/$subj	
		
	echo "$subj: BET"
	fslreorient2std *_anat.nii.gz *_anat_ro
	bet *_anat_ro.nii.gz *_anat_brain -m -R
	fslstats *_anat_brain_mask.nii.gz -V
done
