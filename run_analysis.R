##Here are the data for the project:
#
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# You should create one R script called run_analysis.R that does the following. 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.
#
#Good luck!
##
#

# Working with dplyr package
library(dplyr)

# read data files
traning_data_file  <- read.csv(file = "train/X_train.txt")
traning_label_file <- read.csv(file = "train/y_train.txt")
testing_data_file  <- read.csv(file = "test/X_test.txt")
testing_label_file <- read.csv(file = "test/y_test.txt")

# read dictionary
acivity_labels_file <- read.csv(file = "activity_labels.txt")

# convert to dplyr structure
train <- tbl_df(traning_data_file)
train_label <- tbl_df(traning_label_file)
test  <- tbl_df(testing_data_file)
test_label <-tbl_df(testing_label_file)
act_label <- tbl_df(activity_labels_file)

# 1. merge train an test
merged_data <- rbind_list(train, test)

# 2. extracts only mean and standart deviation
mean_data <- select(merged_data, )
