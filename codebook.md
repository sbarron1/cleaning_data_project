# Codebook: activity_data_tidy.txt

The tidied and summarized Human Activity Recognition Using Smartphones (HAR) Dataset consists of 68 variable.

## Summary from the original codebook:

> Human Activity Recognition Using Smartphones Dataset
> Version 1.0
> ==================================================================
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
> Smartlab - Non Linear Complex Systems Laboratory
> DITEN - Università degli Studi di Genova.
> Via Opera Pia 11A, I-16145, Genoa, Italy.
> activityrecognition@smartlab.ws
> www.smartlab.ws
> ==================================================================
> 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



# Changes made:

Each row is a summary the ,average of the mean and standard deviation (Std) for various measurements, of several experiments measuring a particular activity for a particular subject.

## Variables = 

subject: the id given to a particular subject/volunteer. Numbered 1 to 30

activity: the activities that were monitored in the experiments. They are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The remaining 66 variables are the average of the mean and standard deviation of experimental measurements.
The variable names consist of a series of tokens, in camelcase, that describe the measurement

The tokens that are used are explained here. Tokens that have an either/or relationship are described together.

5 tokens are in every variable name:

t or f: t denotes a time domain signal. f denotes a frequency domain signal

Body or Gravity: Signals were separated based on whether they were caused by the subjects body motion (Body) or Gravity

Acc or Gyro: Acc is a linear acceleration signal recorded by the devices accelerometer. Gyro is a  angular velocity signal measured by a gyroscope

Mean or Std: Whether the measure is the average of the Mean or the Std of an activity of a subject.

X,Y,Z: the axis of the measurement.
 
## Two other tokens are used in some measurements: 
(explanation taken directly from original dataset codebook)

Jerk: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)

Mag:  the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)

##tidiness
I believe this dataset is tidy, According to Hadley Wickham, tidy data:

1. Each variable forms a column.
	While it is clear that the first two columns are variables, the measurement columns are more ambiguous and there are several ways of dealing with them that are consistent with this principle. I choose to treat each measurement type as a variable rather then a value. This decision is based on how they are described in the original datasets readme and features_info, they are a set of measurements that describe an experiment. Or in the case of this data set, they describe the average measurements for several experiments.
	
2. Each observation forms a row.
	Each row is the average of several experiments of an activity (e.g. WALKING) for a subject. 
	
3. Each type of observational unit forms a table.
	This condition would be broken if additional subject variables were brought in such as age or gender. These variables should be stored in a separte table (subject) linked to the present dataset by subject id.
	
# The full list of averaged measurements, grouped by measurement type: 

tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ

tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ

tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ

tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ

tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ

tBodyAccMagMean
tBodyAccMagStd

tGravityAccMagMean
tGravityAccMagStd

tBodyAccJerkMagMean
tBodyAccJerkMagStd

tBodyGyroMagMean
tBodyGyroMagStd

tBodyGyroJerkMagMean
tBodyGyroJerkMagStd

fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ

fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ

fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ

fBodyAccMagMean
fBodyAccMagStd

fBodyAccJerkMagMean
fBodyAccJerkMagStd

fBodyGyroMagMean
fBodyGyroMagStd

fBodyGyroJerkMagMean
fBodyGyroJerkMagStd
