#this script is broken up into sections based on the 
#project requirements.
library(tidyverse)
## requirement 1 ----
#Merges the training and the test sets to create one data set. 

#while descriptive names are not required at this stage, it 
#was convenient to do so here. The names are cleaned up in 
#a later stage
feature_names <- read_lines("UCI HAR Dataset/features.txt")
train <- read_table("UCI HAR Dataset/train/X_train.txt",
                    col_names = feature_names)
test <- read_table("UCI HAR Dataset/test/X_test.txt", 
                   col_names = feature_names)

data <- rbind(train, test)

## requirement 2 ----
#Extract only the measurements on the mean
#and standard deviation for each measurement.

data <- select(data, matches("(mean|std)\\()")) 

## requirement 3 ----
#Uses descriptive activity names to name the activities 
#in the data set

#get activity variable for train and test
activity_train <- read_lines("UCI HAR Dataset/train/y_train.txt")
activity_test <- read_lines("UCI HAR Dataset/test/y_test.txt")

#bind train and test activity variable in the same order as the data 
activity <- c(activity_train, activity_test)
data <- cbind(activity, data)

# get the labels and clean them up a little by removing the leading
# number
activity_labels <- read_lines("UCI HAR Dataset/activity_labels.txt")
activity_labels <- gsub("^[0-9] ", "", activity_labels)

#finally name the activities in the dataset
data$activity <- factor(data$activity, labels = activity_labels)

## requirement 4 ----
#Appropriately labels the data set with descriptive variable names.

#descriptive names were introduced when the train and test were 
#loaded.Here they are cleaned up a bit. The column number, hyphens, 
#and the empty brackets after mean and std were removed

names(data) <- gsub("^[0-9][0-9]?[0-9]? |\\()|-", "", names(data))

#mean and std are capitalised to make variable names more readable
names(data) <- chartr("mean", "Mean", names(data))
names(data) <- chartr("std", "Std", names(data))

#in a few variable names "Body" is mistakenly repeated.
names(data) <- gsub("BodyBody", "Body", names(data))


#requirement 5 ----
#From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

#the subject id field  was added

subject_train <- read_lines("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read_lines("UCI HAR Dataset/test/subject_test.txt")
subject <- c(subject_train, subject_test)

data <- cbind(subject, data)

#the data was grouped by subject and activity and the mean
#of every other variable was calculated
data %>% group_by(subject, activity) %>%
summarise_all(mean) -> summerised_data

write.table(summerised_data, "activity_data_tidy.txt", row.names = FALSE)



