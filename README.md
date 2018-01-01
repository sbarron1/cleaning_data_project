# run_analysis script readme

The run_analysis.R script takes the HAR dataset, cleans it, extracts certain column, and outputs and summarised tidy dataset
The analysis script is divided into five sections based on the requirements of the project. This readme is organised the same way

A note:
Data was read in and out using functions from the readr package, which is part of the tidyverse.
	
	
# 1. merge the training and the test sets to create one data set. 

The feature names, training and test set were brought into the workspace. 
The variables were named in the same function as the read using the col.names argument.
The train and test set were combined, in that order, using rbind.

# 2. extract only the measurements on the mean and standard deviation for each measurement.

Here the mean and standard deviation were extracted by matching mean() and std() using the regex: (mean|std)\\()

It was unclear if the assignment required extracting meanFreq. In features_info.txt meanFreq is described as "Weighted average of the frequency components to obtain a mean frequency". Based on this definition I decided to exclude meanFreq as it is not the actual mean of the measurement.

# 3. uses descriptive activity names to name the activities in the data set.

The activity variable was read in from y_train.txt and y_test.text. 
The train and test activity variable were combined into a vector called activity.
Activity was made the first column in the data using cbind.

At the moment, activity is a factor variable with labels: 1 to 6. 
To make this variable more descriptive, the values in activity_labels.txt were read in.
The values in activity_labels were cleaned (remove leading number) using gsub and subsequently the 
numeric labels were replaced with more descriptive activity labels.

# 4. appropriately labels the data set with descriptive variable names.

Descriptive names were introduced when the train and test were 
loaded.Here they are cleaned up a bit. The column number, hyphens, 
and the empty brackets after mean and std were removed.

mean and std were capitalised to Mean and Std, as it was decided to make the variable names camelcase.

In several variable names there was a typographical error were Body was repeated. The second "Body" was deleted.


# 5. from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

When considering how to tidy this dataset, it was decided that the measurement variables required their own column each rather then being gathered together as they are different aspects of an overall measurement rather then different classes of a factor. 

The subject variable was added. The same procedure was followed as when the activity variable was read in, except the variable names were left untouched.

The data was grouped by subject and activity and the mean of all remaining variables was calculated using summarise_all.

The summarised, tidy data was written out to a txt file.






