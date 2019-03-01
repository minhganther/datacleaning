# datacleaning
This repository was created for the final assignment for the Coursera R course "Getting and Cleaning Data"

In this assignment, the purpose was to "tidy" an existing dataset and create a new dataset by grouping variables and averaging within groups. This project provides a script for the tidying.

## Files

Included files in this project are:
- README.md - Readme file with general information and purpose of the project
- run_analysis.R - R script which was used to tidy the dataset and output a new tidy dataset
- codebook.md - Codebook providing information about the used variables and instruction on how the tidy dataset was produced.

## Tidying of the dataset

The tidying was accomplished by the following steps:
- merging 'train' and 'test' datasets
- assigning descriptive variable names 
- assigning other descriptive variables relating to subject ID and activity
- replacing activity indicators (num values) with their respective full labels
- spelling errors from variable names were corrected (namely duplication errors like '...BodyBody...')

In addition - according to the assignment -,  only features relating to mean - mean() or standard deviation - std() were kept.

Finally, a grouped dataset was created, displaying the mean values of all remaining features, grouped by subject ID and activity.
