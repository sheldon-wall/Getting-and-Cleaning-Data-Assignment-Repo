# Course 3 - Getting and Cleaning Data Course Project - Code Book

### Tidy Dataset Creation - Version 1.0
### Sheldon Wall
### Coursera class participant

## Background - Raw Data Source Details

The original (raw) dataset contained data collected from experiments carried out with a group of 30 subjects.
Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist.  

| Original Data Set |
| --- |
| Human Activity Recognition Using Smartphones Dataset - Version 1.0 |
| Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto |
| Smartlab - Non Linear Complex Systems Laboratory |
| DITEN - Università degli Studi di Genova |
| Via Opera Pia 11A, I-16145, Genoa, Italy |
| activityrecognition@smartlab.ws |
| www.smartlab.ws |

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The following original data files were used to understand and interpret the raw data:
- A data file 'features_info.txt' contained a description of the contents of the domain variables
- A data file 'features.txt' contained the names of the 561 domain variables used to capture data
- A data file 'activity_labels.txt' containing the activity labels
- A data file 'README.txt' containing a description of the experiment and resulting data sets

Each observation in the training and test data sets consisted of the following:
- A data set containing an identifier of the activity
- A data set containing an identifier of the subject
- A data set containing a 561-feature vector with time and frequency domain variables. 

**For a full understanding of the original dataset I refer you to the files mentioned above in the following links **
- [Original Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [Data Set Descritpion](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Citation:** The raw data was gathered and published under [1]:Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Code Book

### Feature Selection  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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
- mean(): Mean value
- std(): Standard deviation

The reasoning behind these selection of features and set of variables is that the assignment explicitly 
states "Extracts only the measurements on the mean and standard deviation for each measurement".  I have interpretted that to include only raw data variables containing the text **mean() and std()** thus reducing the 
raw data variables to be examined from 561 down to 66.

### Tidy Data Dimensions 

In addition to the Activity_Desc and Subject variables the subset of original variables contains 40 Time and 
26 Frequency variables, from the original study, that contained the mean and standard deviation calculations 
resulting in **68 columns**.  

The resulting (tidy) dataset contains **the average** of that subset of variables collected in the original dataset 
aggregated (grouped by) subject (30 participants) and activity (6 activities) resulting in **180 observations**.

### Raw to Tidy Data Mapping Table

The columns have been renamed slightly to improve understanding and the table 
below provides a mapping of the new to old variable names.  Fundamentally they have 
been changed as follows: 

mean.. becomes Mean
std.. becomes Std
t becomes Time
f becomes FFT (Fast Fourier Transform)
- becomes .

The following table provides the variable mapping from raw to tidy format.

| Tidy Data Column	| Raw Data Column
| --- 	| --- 
| Activity_Desc	| 
| Subject	| 
| Time.BodyAcc.Mean.X	| tBodyAcc-mean()-X
| Time.BodyAcc.Mean.Y	| tBodyAcc-mean()-Y
| Time.BodyAcc.Mean.Z	| tBodyAcc-mean()-Z
| Time.BodyAcc.Std.X	| tBodyAcc-std()-X
| Time.BodyAcc.Std.Y	| tBodyAcc-std()-Y
| Time.BodyAcc.Std.Z	| tBodyAcc-std()-Z
| Time.GravityAcc.Mean.X	| tGravityAcc-mean()-X
| Time.GravityAcc.Mean.Y	| tGravityAcc-mean()-Y
| Time.GravityAcc.Mean.Z	| tGravityAcc-mean()-Z
| Time.GravityAcc.Std.X	| tGravityAcc-std()-X
| Time.GravityAcc.Std.Y	| tGravityAcc-std()-Y
| Time.GravityAcc.Std.Z	| tGravityAcc-std()-Z
| Time.BodyAccJerk.Mean.X	| tBodyAccJerk-mean()-X
| Time.BodyAccJerk.Mean.Y	| tBodyAccJerk-mean()-Y
| Time.BodyAccJerk.Mean.Z	| tBodyAccJerk-mean()-Z
| Time.BodyAccJerk.Std.X	| tBodyAccJerk-std()-X
| Time.BodyAccJerk.Std.Y	| tBodyAccJerk-std()-Y
| Time.BodyAccJerk.Std.Z	| tBodyAccJerk-std()-Z
| Time.BodyGyro.Mean.X	| tBodyGyro-mean()-X
| Time.BodyGyro.Mean.Y	| tBodyGyro-mean()-Y
| Time.BodyGyro.Mean.Z	| tBodyGyro-mean()-Z
| Time.BodyGyro.Std.X	| tBodyGyro-std()-X
| Time.BodyGyro.Std.Y	| tBodyGyro-std()-Y
| Time.BodyGyro.Std.Z	| tBodyGyro-std()-Z
| Time.BodyGyroJerk.Mean.X	| tBodyGyroJerk-mean()-X
| Time.BodyGyroJerk.Mean.Y	| tBodyGyroJerk-mean()-Y
| Time.BodyGyroJerk.Mean.Z	| tBodyGyroJerk-mean()-Z
| Time.BodyGyroJerk.Std.X	| tBodyGyroJerk-std()-X
| Time.BodyGyroJerk.Std.Y	| tBodyGyroJerk-std()-Y
| Time.BodyGyroJerk.Std.Z	| tBodyGyroJerk-std()-Z
| Time.BodyAccMag.Mean	| tBodyAccMag-mean()
| Time.BodyAccMag.Std	| tBodyAccMag-std()
| Time.GravityAccMag.Mean	| tGravityAccMag-mean()
| Time.GravityAccMag.Std	| tGravityAccMag-std()
| Time.BodyAccJerkMag.Mean	| tBodyAccJerkMag-mean()
| Time.BodyAccJerkMag.Std	| tBodyAccJerkMag-std()
| Time.BodyGyroMag.Mean	| tBodyGyroMag-mean()
| Time.BodyGyroMag.Std	| tBodyGyroMag-std()
| Time.BodyGyroJerkMag.Mean	| tBodyGyroJerkMag-mean()
| Time.BodyGyroJerkMag.Std	| tBodyGyroJerkMag-std()
| FFT.BodyAcc.Mean.X	| fBodyAcc-mean()-X
| FFT.BodyAcc.Mean.Y	| fBodyAcc-mean()-Y
| FFT.BodyAcc.Mean.Z	| fBodyAcc-mean()-Z
| FFT.BodyAcc.Std.X	| fBodyAcc-std()-X
| FFT.BodyAcc.Std.Y	| fBodyAcc-std()-Y
| FFT.BodyAcc.Std.Z	| fBodyAcc-std()-Z
| FFT.BodyAccJerk.Mean.X	| fBodyAccJerk-mean()-X
| FFT.BodyAccJerk.Mean.Y	| fBodyAccJerk-mean()-Y
| FFT.BodyAccJerk.Mean.Z	| fBodyAccJerk-mean()-Z
| FFT.BodyAccJerk.Std.X	| fBodyAccJerk-std()-X
| FFT.BodyAccJerk.Std.Y	| fBodyAccJerk-std()-Y
| FFT.BodyAccJerk.Std.Z	| fBodyAccJerk-std()-Z
| FFT.BodyGyro.Mean.X	| fBodyGyro-mean()-X
| FFT.BodyGyro.Mean.Y	| fBodyGyro-mean()-Y
| FFT.BodyGyro.Mean.Z	| fBodyGyro-mean()-Z
| FFT.BodyGyro.Std.X	| fBodyGyro-std()-X
| FFT.BodyGyro.Std.Y	| fBodyGyro-std()-Y
| FFT.BodyGyro.Std.Z	| fBodyGyro-std()-Z
| FFT.BodyAccMag.Mean	| fBodyAccMag-mean()
| FFT.BodyAccMag.Std	| fBodyAccMag-std()
| FFT.BodyBodyAccJerkMag.Mean	| fBodyBodyAccJerkMag-mean()
| FFT.BodyBodyAccJerkMag.Std	| fBodyBodyAccJerkMag-std()
| FFT.BodyBodyGyroMag.Mean	| fBodyBodyGyroMag-mean()
| FFT.BodyBodyGyroMag.Std	| fBodyBodyGyroMag-std()
| FFT.BodyBodyGyroJerkMag.Mean	| fBodyBodyGyroJerkMag-mean()
| FFT.BodyBodyGyroJerkMag.Std	| fBodyBodyGyroJerkMag-std()

###Activity Desc - was derived in Step 3 of the script using the following:

|Activity | Activity Description|
| --- | ---
|1	|WALKING
|2	|WALKING_UPSTAIRS
|3	|WALKING_DOWNSTAIRS
|4	|SITTING
|5	|STANDING
|6	|LAYING
