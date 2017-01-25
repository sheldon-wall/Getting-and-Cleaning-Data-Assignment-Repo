# Course 3 - Getting and Cleaning Data Course Project README

### Tidy Dataset Creation - Version 1.0
### Sheldon Wall
### Coursera class participant

## Overview

The purpose of this course project is the demonstration of ability to collect, work with,
and clean a data set.  The goal is to prepare a tidy data set that can be used for later analysis.
Fundamentally this will be achieved by delivering the following [components](https://github.com/jtleek/datasharing):

1. The raw data.
2. A [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) 
3. A code book describing each variable and its values in the tidy data set.  
4. An explicit and exact recipe used to go from 1 -> 2,3 

The details for these components can be found in the contents section below.

## Summary

### 1. Raw Data

The original (raw) dataset contained data collected from experiments carried out with a group of 30 subjects.
Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist.  

It was gathered and published under [1]:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited. 
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

**Note: The Raw Data set is imported by the script run_analysis.r so there is no need to independantly 
copy the raw data prior to running the script **

### 2. Tidy Data - data set created by executing the script 

The resulting (tidy) dataset contains **the average** of a subset of variables collected in the original dataset 
aggregated (grouped by) subject (30 participants) and activity (6 activities) resulting in **180 observations**.

In addition to the subject and activity variables the subset of original variables contains 40 time and 
26 frequency variables, from the original study, that contained the mean and standard deviation calculations 
resulting in **68 columns**.

### 3. Code Book - 'Code Book.md'

Further explaination of processing performed against the raw data and the resulting tidy data set created 
can found in the Code Book.md file available in the same location as this README.md file.

### 4. Instruction List/Script - 'run_analysis.r' 

The script used to perform the raw dataset to create the tidy dataset can be found in the the run_analysis.r script file.
It has been created using R-Studio (R version 3.3.2) on Windows operating system (Windows 10 Pro - Version 1511)

The script loads the raw data from the identified [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
and prepares it for use.  

Then five steps are performed to:
1. Merge the training and test data sets into one
2. Extract the measurements on the mean and std. deviation
3. Create Descriptive activity names to name the activities in the dataset
4. Label the dataset with descriptive variable names
5. Create a second, independant tidy data set with the average of each variable for each activity and each subject

## Contents

The complete project should include the following files:
- 'README.md': This file
- 'Code Book.md': Describes the variables, the data and transformations performed to clean up the data
- 'run_analysis.r': An R analysis script used to process the raw data and transform to tidy data

