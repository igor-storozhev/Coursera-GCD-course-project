Code book
=========

The experiments have been carried out with a group of 30 volunteers within an ag
e bracket of 19-48 years. Each person performed six activities (WALKING, WALKING
_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (
Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscop
e. These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

I have decided to use for course project subset of the following accelerometer mean and deviation data.
```
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
```

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Each of this item commented in script code as print command. Result data file "resTbl.txt" is written by command:

```
write.table(resTbl, file = "resTbl.txt", row.name = FALSE)
```
You can read this data set using R command:
```
data <- (read.table("resTbl.txt", header=T ))

```
Result table contains fields:
```
"subject" - numbered person performed six activities (WALKING, WALKING
_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 
"activity" - one of the following person activity: WALKING, WALKING
_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

"aggrMeanAccX" - average of tBodyAcc-mean()-X variable for each activity and each subject

"aggrMeanAccY" - average of tBodyAcc-mean()-Y variable for each activity and each subject

"aggrMeanAccZ" - average of tBodyAcc-mean()-Z variable for each activity and each subject

"aggrStdAccX" - average of tBodyAcc-std()-X variable for each activity and each subject
"aggrStdAccY" - average of tBodyAcc-std()-X variable for each activity and each subject

"aggrStdAccZ" - average of tBodyAcc-std()-X variable for each activity and each subject
```

