I downloaded the dataset; 
1. a full description from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. the data for the task from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R Script
run_analysis is an R script file that contains code for processing unclean data to tidy data, and subsequentlt 
printing a new tidy dataset called secondTidyData.txt.

The data processing steps involves:
a. downloading data from source to local drive, then use read.table to read the data into r
b. the data is assign appropriate column headings
c. merge all training and testing data to merge_train and merge_test respectively, then merge merge_train and merge_test
to AllData
d Extracting only the measurements on the mean and standard deviation for each measurement
e. Make a vector for defining ID, mean and standard deviation
f. select relevant column names from AllData 
g. Using descriptive activity names to name the activities in the data set
h. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
i. Making second tidy data set
j. Writing second tidy data set in txt file

Variables
Lost of different variables are use to store data at various points during the loading and orocessing stages
some variables used includes.
1. x_train, y_train, x_test, y_test, subject_train and subject_test which holds data from the downloaded files.
2. merge_train, merge_test and AllData holds merge data for further analysis.
3. features stores the correct names for the x_data dataset, which are applied to the appropriate column names

