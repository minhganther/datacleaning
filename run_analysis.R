
# Tidy Dataset ------------------------------------------------------------

## This R script aims to read and tidy data from the existing dataset which can
## be downloaded at
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
## First, it reads all the necessary files (dataset, labels for activity,
## subject ID, features) and creates a dataframe for each train or test set.
## The train and test set are then merged, thus creating the tidy dataset.

# Set your working directory containing the data files
setwd("./UCI HAR Dataset")
library(dplyr)

# Read activity labels 
activity_labels <- read.table("activity_labels.txt", header=FALSE, col.names=c("activity", "activity.name"))
y_test <- read.table("./test/y_test.txt", header=FALSE, col.names="activity")
y_train <- read.table("./train/y_train.txt", header=FALSE, col.names="activity")

# Read feature names
features <- unlist(read.table("./features.txt", header=FALSE, stringsAsFactors = FALSE)[2])
features <- gsub("BodyBody", "Body", features) ## remove duplicate spelling 

# Read subject names
subject_test <- read.table("./test/subject_test.txt", header=FALSE, col.names="subjectID")
subject_train <- read.table("./train/subject_train.txt", header=FALSE, col.names="subjectID")

# Read datasets and apply feature labels
X_train <- read.table("./train/X_train.txt", header=FALSE, col.names=features)
X_test <- read.table("./test/X_test.txt",header=FALSE, col.names=features)

# Select only mean() and std() features
index <- grep("mean()|std()", features)
X_train <- X_train[,index]
X_test <- X_test[,index]

# Add activity column and group column indicating train or test group
Xy_train <- cbind(subject_train, activity= y_train, group="train", X_train)
Xy_test <- cbind(subject_test, activity= y_test, group="test", X_test)

# Merge the datasets, add descriptive activity labels as column, drop indexed activity column
Xy_data <- rbind(Xy_train, Xy_test)
Xy_data <- merge(activity_labels, Xy_data, by="activity"); Xy_data$activity = NULL
####### Xy_data is the tidy dataset


# Create 2nd dataset grouped by subjectID and activity --------------------

 # Create a tbl to use group_by function from dplyr
 Xy_tbl <- as.tbl(Xy_data)
 # Group by subjectID and activity
 Xy_tbl_grouped <- group_by(Xy_tbl, subjectID, activity.name)
 # Calculate mean groupwise, skip over group column
 
 Xy_summary <- summarize_at(Xy_tbl_grouped, 4:82, mean)
 ###### Xy_summary is the tidy dataset, grouped by subject and activity and summarized by mean
 
 write.table(Xy_summary, file = "rundata.txt", row.name=FALSE)
 