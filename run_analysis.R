## Preparation

library(dplyr)
library(tidyr)
library(data.table)
setwd("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset")

resourceUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

train <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\X_train.txt")
test <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\X_test.txt")

train_label <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\y_train.txt")
test_label <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\y_test.txt")

features <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\features.txt")
activity_labels <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\activity_labels.txt")

subject_train <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table("C:\\projects\\github\\R-projects\\1_gettingData\\UCI HAR Dataset\\test\\subject_test.txt")


### 1. Merges the training and the test sets to create one data set.
merged_data <- rbind(train, test)


### 2. Extracts only the measurements on the mean and standard deviation 
### for each measurement. 

mean <- matrix(data=NA, nrow=1, ncol=ncol(merged_data))
for (i in 1:ncol(merged_data)) {
  mean[1, i] <- mean(merged_data[, i])
}

std <- matrix(data=NA, nrow=1, ncol=ncol(merged_data))
for (i in 1:ncol(merged_data)) {
  std[1, i] <- sd(merged_data[, i])
}

### 3. Uses descriptive activity names to name the activities in the data set

labeled_train <- cbind(train, train_label)
labeled_test <- cbind(test, test_label)

features <- features[,2]

### 4. Appropriately labels the data set with descriptive variable names. 




### 5. From the data set in step 4, creates a second, 
### independent tidy data set with the average of each variable 
### for each activity and each subject.










