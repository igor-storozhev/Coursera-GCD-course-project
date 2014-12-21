Coursera-GCD-course-project
===========================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

It is expected data for script are located in the same directory.

Script output:

> source("run_analysis.R")
[1] "# read activity dictionary"
[1] "# read columns features dictionary"
[1] "# read train data files"
[1] "# make train column names"
[1] "# merge y,x tables"
[1] "# name new column"
[1] "# merge subject to y,x"
[1] "# make column names"
[1] "# read test data files"
[1] "# make test column names"
[1] "# merge y,x tables"
[1] "# name new column"
[1] "# merge subject to y,x"
[1] "# make column names"
[1] "# 1. merge train and test data"
[1] 10299   563
[1] "# remove init data to free memory"
[1] "# 2. extracts only mean and standart deviation columns"
[1] "# 3. Name the acitvities in data set"
[1] "# 4. Label data set with descriptive variable names."
[1] "# 5. Group by each subject, activity and count mean of acc.* variables."
[1] "# Working with dplyr package"

Attaching package: ‘dplyr’

The following object is masked from ‘package:stats’:

    filter

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

[1] "# Convert data to dplyr structure and group by subject, activity"
[1] "# Culculate result data set"
Source: local data frame [180 x 8]
Groups: subject

   subject           activity aggrMeanAccX aggrMeanAccY aggrMeanAccZ
1        1             LAYING    0.2215982 -0.040513953   -0.1132036
2        1            SITTING    0.2612376 -0.001308288   -0.1045442
3        1           STANDING    0.2789176 -0.016137590   -0.1106018
4        1            WALKING    0.2773308 -0.017383819   -0.1111481
5        1 WALKING_DOWNSTAIRS    0.2891883 -0.009918505   -0.1075662
6        1   WALKING_UPSTAIRS    0.2554617 -0.023953149   -0.0973020
7        2             LAYING    0.2813734 -0.018158740   -0.1072456
8        2            SITTING    0.2770874 -0.015687994   -0.1092183
9        2           STANDING    0.2779115 -0.018420827   -0.1059085
10       2            WALKING    0.2764266 -0.018594920   -0.1055004
..     ...                ...          ...          ...          ...
Variables not shown: aggrStdAccX (dbl), aggrStdAccY (dbl), aggrStdAccZ (dbl)
[1] "# Write result data set to resTbl.txt"
[1] "# End of script"
> 
 
