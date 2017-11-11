# repronim17
Challenge project for ReproNim 2017 workshop

Objective: randomly select two groups of 15 subjects, calculate their brain volumes, and compare means of the two groups (test for significant difference)

* Shell script to download data (Ely)
* Pull neurodocker container (TBD)
* Dockerfile to create a Docker container with fsl-core installed (TBD)
* Run bet within Docker container, use fslmaths to sum up mask to calculate brain volume (TBD)
* Jupyter notebook to compare means between two groups