##Here are the data for the project script:
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

print("# read activity dictionary")
act_l  <- read.table(file = "UCI HAR Dataset/activity_labels.txt") 

print("# read columns features dictionary")
cols_l  <- read.table(file = "UCI HAR Dataset/features.txt") 

print("# read train data files")
train_x <- read.table(file = "UCI HAR Dataset/train/X_train.txt") 
train_y <- read.table(file = "UCI HAR Dataset/train/y_train.txt") 
train_s <- read.table(file = "UCI HAR Dataset/train/subject_train.txt") 

print("# make train column names")
names(train_x) <- cols_l$V2

print("# merge y,x tables")
train_yx <- cbind(train_y, train_x)

print("# name new column")
names(train_yx)[1] <- "act_code"

print("# merge subject to y,x")
train_syx <- cbind(train_s, train_yx)

print("# make column names")
names(train_syx)[1] <- "subject"

print("# read test data files")
test_x  <- read.table(file = "UCI HAR Dataset/test/X_test.txt") 
test_y  <- read.table(file = "UCI HAR Dataset/test/y_test.txt") 
test_s  <- read.table(file = "UCI HAR Dataset/test/subject_test.txt") 

print("# make test column names")
names(test_x) <- cols_l$V2

print("# merge y,x tables")
test_yx <- cbind(test_y, test_x)

print("# name new column")
names(test_yx)[1] <- "act_code"

print("# merge subject to y,x")
test_syx <- cbind(test_s, test_yx)

print("# make column names")
names(test_syx)[1] <- "subject"

print("# 1. merge train and test data")
data <- rbind(train_syx, test_syx)

print(dim(data))

print("# remove init data to free memory")
rm(train_x)
rm(train_y)
rm(train_s)
rm(train_yx)
rm(train_syx)
rm(test_x)
rm(test_y)
rm(test_s)
rm(test_yx)
rm(test_syx)
rm(cols_l)
#rm(act_l)

#data.df <- tbl_df(data)
#act.df <- tbl_df(act_l)


print("# 2. extracts only mean and standart deviation columns")
cols <- c("subject", "act_code",  
	  "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z",
	  "tBodyAcc-std()-X",  "tBodyAcc-std()-Y",  "tBodyAcc-std()-Z")

extData <- data[ , cols]


print("# 3. Name the acitvities in data set")
extData$act_code <- with(act_l, V2[match(extData$act_code, V1)])

print("# 4. Label data set with descriptive variable names.")
names(extData)[2] <- "activity"
names(extData)[3] <- "accMeanX"
names(extData)[4] <- "accMeanY"
names(extData)[5] <- "accMeanZ"
names(extData)[6] <- "accStdX"
names(extData)[7] <- "accStdY"
names(extData)[8] <- "accStdZ"
names(extData)

print("# 5. Group by each subject, activity and count mean of acc.* variables.")
print("# Working with dplyr package")
library(dplyr)

print("# Convert data to dplyr structure and group by subject, activity")
extTbl <- group_by(tbl_df(extData), subject, activity)

print("# Culculate result data set")
resTbl <- summarise(extTbl, aggrMeanAccX = mean(accMeanX), 
		    aggrMeanAccY = mean(accMeanY), 
		    aggrMeanAccZ = mean(accMeanZ), 
		    aggrStdAccX = mean(accStdX), 
		    aggrStdAccY = mean(accStdY), 
		    aggrStdAccZ = mean(accStdZ))
print(resTbl)

print("# Write result data set to resTbl.txt")
write.table(resTbl, file = "resTbl.txt", row.name = FALSE)

print("# End of script")
