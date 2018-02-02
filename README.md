# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course. The purpose of this project is to show the student's ability to collect, work with and clean a data set.

This repository contains the following files:

* **README.md** - provides an overview of the data set and how it was created
* **CodeBook.md** - a code book that describes the variables, data and transformations made to come up a tidy data.
* **run_analysis.R** - an R script that is used to perform the analysis and create the tidy data.
* **tidyData.txt** - a tidy data set with 180 observations and 479 variables. It contains the average of the measurements for each activity and subject. Refer to CodeBook.md for comprehensive information of these variables and of the tidy data.

## Data Source

The data set used is collected from the accelerometers from the Samsung Galaxy S smartphone.

Link for the full description of dataset: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Link for the raw data:(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Creating the tidy data

The **run_analysis.R** is used to create the output file **tidyData.txt** and also used to clean the downloaded data set. This script does the following:

1. Create a data directory if it doesn't exist
2. Download the data set and unzip the file
3. Merge the training and the test sets to create one data set
4. Extract only the measurements on the mean and standard deviation for each measurement
5. Use descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
