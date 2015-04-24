Getting and Cleaning Data Course Project


Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation


Data

The data for this project is from Human Activity Recognition Using Smartphones Dataset and can be found at the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope. 
A 561-feature vector with time and frequency domain variables. 
Its activity label. 
An identifier of the subject who carried out the experiment.

The dataset folder “UCI HAR Dataset” includes the following files:
activity_labels.txt - Links the class labels with their activity name
features_info.txt - Shows information about the variables used on the feature vector
features.txt - List of all features
test/subject_test.txt - - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
test/X_test.txt - Test set
test/y_test.txt - Test labels
train/subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
train/X_train.txt - Training set
train/y_train.txt - Training labels

Transformations
The transformations of this data set can be found in the R script file run_analysis.R

Get the dataset
Downloads the dataset file and unzip it

Load raw data 
Reads a file in table format and creates a data frame from it

main directory
Load “features.txt” into features data frame
Load “activity_labels.txt” into activityLabels

test directory
Load “test/subject_test.txt” into subject_test data frame
Load “test/y_test.txt” into ytest data frame
Load “test/x_test.txt” into xtest data frame

TRAIN directory
Load “train/subject_train.txt” into subject_train data frame
Load “train/y_train.txt” into ytrain data frame
Load “train/x_train.txt” into xtrain data frame

Combine the test and training data 
Combine all test data frames and all train data frames into a data frame called “data”

Extracts only the measurements on the mean and standard deviation for each measurement
In this step, the column names for the selected measurements of mean and standard deviation are extracted.

Then the data set “data” is subsetted to only include subject, activity and selected measurement columns, which yields to a new data set called “finalData”.

Uses descriptive activity names to name the activities in the data set
In this step, the “finalData” data set is merged with activityLabels data frame so activity id in the data set is replaced with more descriptive activity names.

Appropriately labels the data set with descriptive variable names.
In this step, the columns in “finalData” data set are given appropriate and more descriptive variable names.

Create independent tidy data set
From the data set in step 4, an independent tidy data set is created with the average of each variable for each activity and each subject.

This step requires loading “plyr” library. The “finalData” data set is then aggregated with average data from each activity performed by each subject. Then the new tidy data set is written to a text file called “tidydata.txt” and stored in main directory.