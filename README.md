GettingAndCleaningData
======================

This repository contains an R file 'run_Analysis.R' and a code book file 'CodeBook.MD'

## run_Analysis.R

This R script creates two tidy data sets using accelerometer data from the UCI machine learning data repository.  The script downloads the data to the working directory and merges the data from two sets of three files containing test subject identifiers, activity labels, and accelerometer data respectively.  The two sets of files correspond to a test set and a training set. Here are the names of the original files:

Test subject identifiers:
subject_test.txt
subject_train.txt

Activity labels:
y_test.txt
y_train.txt

Accelerometer data:
X_test.txt
X_train.txt

This combined dataset is merged with the file 'activity_labels.txt' which maps a descriptive activity name for each activity label in the data set.  The accelerometer data columns are given labels taken from the file 'features.txt' The data is subsetted to include only mean and standard deviation aggregations of the accelerometer data.  Specifically the script keeps only accelerometer columns containing either "std()" or "mean()".  Other columns contain these strings without parentheses but those columns correspond to a different aggregate function, meanFreq, or an angle value. After performing this subset the accelerometer meaurements are cleaned up, removing the index values appearing at the beginning of the colmn name and any special characters.  This data is saved as "AccelerometerData.txt", the first tidy data set output by the script.

A separate data set is created by finding the average of the accelerometer measurements for each combination of subject ID and activity name.  The accelerometer measurement column names from the original dataset are appended with 'Average'.  This second tidy data set is saved as "AverageAccelerometerData.txt".

The script is fully commented with further details.

## CodeBook.MD

This markdown file describes the labels and variables in the two data sets "AccelerometerData.txt" and "AverageAccelerometerData.txt"