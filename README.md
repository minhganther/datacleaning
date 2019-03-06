# Datacleaning
This repository was created for the final assignment for the Coursera R course "Getting and Cleaning Data". The data used within this project was created by the UCI and can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

In this assignment, the purpose was to "tidy" an existing dataset and create a new dataset by grouping variables and averaging within groups. This project provides a script for the tidying which outputs the clean dataset.

The R script accomplishes the following things:
   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement.
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names.
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

Included files in this project are:
- README.md - Readme file with general information and purpose of the project
- run_analysis.R - R script which was used to tidy the dataset and output a new tidy dataset
- Codebook.md - Codebook providing information about the used variables and instruction on how the tidy dataset was produced.

## Tidying of the dataset

The tidying was accomplished by the following steps:
- merging 'train' and 'test' datasets
- assigning descriptive variable names 
- assigning other descriptive variables relating to subject ID and activity
- replacing activity indicators (num values) with their respective full labels
- spelling errors from variable names were corrected (namely duplication errors like '...BodyBody...')
- only features relating to mean - mean() or standard deviation - std() were kept.

Finally, a grouped dataset was created, displaying the mean values of all remaining features, grouped by subject ID and activity.

For details, refer to the Codebook.md section *Cleaning of the data*.
