#Getting and Cleaning Data Course Project

##Script: run_analysis.R

###The script does the following steps:

1. Download the zip file with source data and extract it. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###How to run the script:
1. Copy the script to a folder "project" and in Rstudio Console run setwd("./project")
2. In RStudio Console, run:source("run_analysis.R), you will see the following messages and get a text file "result.txt" in the same folder.

* [run_analysis.R] download data and unzip the package...
* [run_analysis.R] current directory:D:/My Learning/Data Science/Getting and Clearing Data/Project/UCI HAR Dataset
* [run_analysis.R] read features
* [run_analysis.R] read activity_labels
* [run_analysis.R] read subject_train
* [run_analysis.R] read X_train
* [run_analysis.R] read Y_train
* [run_analysis.R] read subject_test
* [run_analysis.R] read X_test
* [run_analysis.R] read Y_test
* [run_analysis.R] Process features file
* [run_analysis.R] Extract only the mean and std from X_train and X_test
* [run_analysis.R] Get train activity
* [run_analysis.R] Get test activity
* [run_analysis.R] Bind train data
* [run_analysis.R] Combine train and test data
* [run_analysis.R] Reshape the dataset
* [run_analysis.R] Output the dataset to a txt file


###On this repository, there are following files:
* Readme.md
* Cokebook.md
* result.txt
* run_analysis.R
* features.txt
* README_ori.txt 



