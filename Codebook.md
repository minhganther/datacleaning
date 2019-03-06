---
title: "Codebook"
author: "Minh Ganther"
date: "March 6, 2019"
output: html_document
---

## Project Description

This repository was created as an assignment to the Data Analysis Course "[Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning/home/welcome)"" by Coursera.
The purpose of the project was to collect data, work and clean up the dataset so that it can later be used for analysis.
The task was to create an R script that fulfills the following tasks:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The project uses data from the dataset "Human Activity Recognition Using Smartphones Data Set" by the UCI which can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Study design, collection of data and data processing

For more details on the study, please visit the original authors' repository page found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
Briefly, the authors collected data of 30 study participants wearing fitness trackers while performing certain activities. The measurements were derived from the embedded accelerometer and gyroscope within the tracker devices and noise-filtered. 
For extensive details on data processing, please look at the 'features_info.txt' file on the author's repository page.

## Creating the tidy datafile

### Guide to create the tidy data file

In order to clean the data, several steps were carried out. First, all necessary data was loaded into R. Then spelling errors were removed. A combined dataframe with headers was created, unneeded features were removed. *train* and *test* datasets were merged to one dataframe. Activity indices were replaced by their respective descriptive names. Data was grouped by activity and subject identifier and summarized by calculating group-wise mean. For sake of readibility, feature names were not significantly altered since I personally find the abbreviations easier to read.

### Cleaning of the data

1. Download the data
2. Read data into R (separate files consisting of subject names, activity names, feature names, measurement data)
3. Clean feature names (remove spelling errors)
4. Merge measurement data and feature names (indicating the column headers), at first separately for *train* and *test* datasets
5. Remove unneeded columns by selecting only features containing *mean()* or *std()* values.
6. Merge *train* and *test* dataset to one dataframe.
7. Replace numeric activity indicators by their real names by merging the dataframe with the activity name data.
8. Create a tbl (dplyr package) and group by activity and subject ID
9. Summarize the data by applying the mean group-wise.
10. Write the dataset into a rundata.txt file.

## Description of the variables in the rundata.txt file

The rundata.txt file represents the output of the run_analysis.R script. It shows the final tidy dataset, which shows the mean for each feature (columns) grouped by suject ID and activity. 

* Dimensions: 180 observations x 81 variables

### subjectID

This variable is a integer which denotes the identifier for a study participant (in total: 30)
Short description of what the variable describes.

### activity.name

The character string indicates one of six possible activities which were carried out during the measurement.
The possible values are: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

### Feature variables

For more detail on how these features were obtained in the original study, please visit the original authors' webpage and refer to the 'features_info.txt' file.
Briefly, a feature name is composed of several building blocks which describe the feature and how it was obtained. 

Abbreviation    | Description
------------    | -----------
t               | denotes time domain signals
f               | denotes frequency domain signals calculated by Fast-Fourier-Transformation
Body            | denotes body signals
Gravity         | denotes gravity signals
Acc 	        | data stem from accelerometer signals
Gyro	        | data stem from gyroscope signals
Jerk            | jerk signals derived from body linear acceleration and angular velocity
Mag	            | signal magnitude calculated using the Euclidean norm
-XYZ	        | denotes direction of a 3-axial signal in possible X, Y and Z direction
mean()          | Mean value
std()           | Standard deviation value

## Sources

[A Codebook Template](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41) from Joris Schut was used to create the codebook.

[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)