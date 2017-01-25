##
## Course 3 - Getting and Cleaning Data Course Project
## 

library(dplyr)

## Tidy Dataset has been created as per specifications available here 
## ftp://cran.r-project.org/pub/R/web/packages/tidyr/vignettes/tidy-data.html

## create a data directory if none exists 
dataDir <- "./data/Course 3 Project"
if(!file.exists(dataDir)){
    dir.create(dataDir)
}

## get the zip file based on the supplied data set location
fileURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- file.path(dataDir,"project.zip")

if(!file.exists(filename)){
    download.file(fileURL1,destfile = filename)
}

## unzip the zip file to a temporary directory
td <- tempdir()
projectDir = file.path(dataDir,"UCI HAR Dataset")
if(!file.exists(projectDir)){
    unzip(filename, ex = td)
}

##########
## Setup 
##########

## get the column headings for the training and testing data that exists in the features file
## and transpose them from row to columns.  used later to construct tidy data 
filename <- file.path(td,"UCI HAR Dataset","features.txt");
column_headings <- read.table(filename,header = FALSE, col.names = c("Num","Var_Name"))

##########################################################
## Step 1: Merge the training and test data sets into one
##########################################################

## read test activity
filename <- file.path(td,"UCI HAR Dataset","test","y_test.txt");
test_activity <- read.table(filename,header = FALSE, col.names = "Activity")

## read test subject
filename <- file.path(td,"UCI HAR Dataset","test","subject_test.txt");
test_subject <- read.table(filename, header = FALSE, col.names = "Subject")

## read test data and assign column heads from features.txt
filename <- file.path(td,"UCI HAR Dataset","test","x_test.txt");
test_data <- read.table(filename, header = FALSE, col.names = column_headings[,2])

## add test subject and activity to front columns of test data 
test_data <- bind_cols(test_subject, test_data)
test_data <- bind_cols(test_activity, test_data)

## read train activity
filename <- file.path(td,"UCI HAR Dataset","train","y_train.txt")
train_activity <- read.table(filename,header = FALSE, col.names = "Activity")

## read train subject
filename <- file.path(td,"UCI HAR Dataset","train","subject_train.txt")
train_subject <- read.table(filename,header = FALSE,col.names = "Subject")

## read train data and assign column headings from features.txt
filename <- file.path(td,"UCI HAR Dataset","train","X_train.txt")
train_data <- read.table(filename,header = FALSE, col.names = column_headings[,2])

## add train subject and activity to front columns of train data (tidy data)
train_data <- bind_cols(train_subject, train_data)
train_data <- bind_cols(train_activity, train_data)

## combine the training and test sets together
combined_data <- bind_rows(train_data, test_data)

#####################################################################
## Step 2: Extracts the measurements on the mean and std. deviation
#####################################################################

## Note - explicitly deciding to extract only columns with mean() or std() and
## not columns which may have the word "mean" elsewhere in the column heading

combined_data <- combined_data %>%
    select(c(1,2), matches("(mean[.]{2})|(std[.]{2})",ignore.case=FALSE))

###############################################################################
## Step 3: Use Descriptive activity names to name the activities in the dataset
###############################################################################

## get activity labels
filename <- file.path(td,"UCI HAR Dataset","activity_labels.txt")
activity_label <- read.table(filename, header = FALSE,col.names = c("Activity","Activity_Desc"))

## now update the combined data with an activity description (tidy data)
combined_data <- merge(activity_label, combined_data)

#############################################################
## Step 4: Label the dataset with descriptive variable names 
#############################################################

## leading t becomes Time
## mean.. becomes Mean
## std.. becomes Std
## leading f becomes FFT (Fast Fourier Transform)
## - separators all become "."

names(combined_data) <- gsub("mean..","Mean",names(combined_data),fixed = TRUE)
names(combined_data) <- gsub("std..","Std",names(combined_data),fixed = TRUE)
names(combined_data) <- gsub("^t","Time.",names(combined_data))
names(combined_data) <- gsub("^f","FFT.",names(combined_data))
names(combined_data) <- gsub("-",".",names(combined_data))

########################################################################
## Step 5: Create a second, independant tidy data set with the average 
##         of each variable for each activity and each subject.
########################################################################

tidy_dataset <- combined_data %>%
                select(-Activity) %>%
                group_by(Activity_Desc, Subject) %>%
                summarize_each(funs(mean))

filename <- file.path(dataDir,"tidy_dataset.txt")
write.table(tidy_dataset, file = filename,row.names = FALSE)
