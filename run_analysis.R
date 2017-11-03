
# Data is downloaded to local drive and read into r using read.table reading

# obtaining training dataset

x_train <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/train/subject_train.txt")


# obtaining testing dataset

x_test <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/test/subject_test.txt")

# obtaining features dataset
features <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/features.txt", as.is= TRUE)

# obtaining activity dataset
activity_labels <- read.table("D:/Document/Supplement/Data_Sci/Get_Clean_Data/UCI HAR Dataset/activity_labels.txt")

# setting column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

# combine training and testing dataset
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
AllData <- rbind(merge_train, merge_test)

# Extracting only the measurements on the mean and standard deviation for each measurement
colNames <- colnames(AllData)

# MAKE A vector for defining ID, mean and standard deviation:
mean_std_dev <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# select the relevant columns/variables from AllData variable:
subsetMean_Std_Dev <- AllData[ , mean_std_dev == TRUE]

# Using descriptive activity names to name the activities in the data set:
Des_Activity_Names <- merge(subsetMean_Std_Dev, activity_labels,
                              by='activityId',
                              all.x=TRUE)

# create a second, independent tidy dataset with the average of each variable for each activity and each subject:
# Making second tidy data set
New_Tidy_Data <- aggregate(. ~subjectId + activityId, Des_Activity_Names, mean)
New_Tidy_Data <- New_Tidy_Data[order(New_Tidy_Data$subjectId, New_Tidy_Data$activityId),]

# Writing a second tidy dataset in txt file

write.table(New_Tidy_Data, "secondTidyData.txt", row.name=FALSE)









