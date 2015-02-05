## <a name="introduction"></a> Introduction
This file explains how to generate and understand the tidy data set with the average of each variable for each activity and each subject, based on data collected from the accelerometers from the Samsung Galaxy S smartphone. In Section [Generating tidy data set](#generateData), we describe how to generate the tidydata set from the raw data. In Section [Cleaning process](cleaningProcess), the data cleaning and processing is detailed. The content of the tidy data set in defined in Section [Content of the tidy data set](contentTidy). 



## <a name="generateData"></a> Generating tidy data set
The original data set can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The zip file should be stored in the same directory as *run_analysis.R* for the script to be working.

More information about the data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

To generate the tidy data set, just type:

  R CMD BATCH run_analysis.R

## <a name="cleaningProcess"></a> Cleaning process: from raw data to tidy data set
The script takes in input the following files:

- UCI HAR Dataset/train/X_train.txt: Training set
- UCI HAR Dataset/train/y_train.txt: Training labels
- UCI HAR Dataset/train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- UCI HAR Dataset/test/X_test.txt: Test set
- UCI HAR Dataset/test/y_test.txt: Test labels
- UCI HAR Dataset/test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- UCI HAR Dataset/features.txt: List of all features (561)
- UCI HAR Dataset/activity_labels.txt: Links the class labels with their activity name

The processing are the following:

- raw data are unzipped
- the different files are read and data.frames are created (possibly suppressing some blank spaces, which are not missing data)
- training and test sets have been merged
- column names have been renamed to avoid duplica (using the function make.names, which preserves the name of the column possibly adding ".x" to avoid duplica, "x" is a number)
- variables with mean or std have been selected
- a traintest variable has been created to keep track of whether the observation comes from the training or the testing dataset (not that this info is not kept in the tidy data set but only in the data.frame called mdfF.MeanStd)
- the activity label and the subject id have been added to the data.frame
- finally the tidy data set has been created, selecting all variables but the variable *trainset*, and grouping by the variables *subject* and *activity_label*. The mean has been calculated for each variable and a wide matrix has been obtained using the *gather()* function.

The content of the tidy data set is described in Section [Content of the tidy data set](#contentTidy).

## <a name="contentTidy"></a> Content of the tidy data set 
The tidy data set contains 4 columns:

- subject: the subject id
- activity_label: the activity label
- feature: the measurement
- acceleration: the acceleration or angular velocity value (see [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more info and in particular one can have a look at *UCI HAR Dataset/features_info.txt*. 
