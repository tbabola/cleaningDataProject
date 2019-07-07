# Getting and Cleaning Data Project
## Overview

Data were taken from a wearable devices study (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and processed to conform to tidy data standards. 
The original study used machine learning to help predict what activity a user was performing based on phone accelerometer data and, therefore, split the dataset randomly into a training and test set. 
These two datasets were merged together. 

For our project, only the mean and standard deviation measurements were required, so extraneous variables were dropped from the data set (data dataframe).

The data were then aggregated into the mean measurements from each subject for each activity (data2 dataframe).