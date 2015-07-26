# Course project for the Getting and Cleaning Data


This is a course project for the Getting and Cleaning Data Coursera course by by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD at John Hopkins University.

This project transforms the original performs prescribed transformations on the Human Activity Recognition Using Smartphones Dataset
Version 1.0.  This dataset can be found here 

This will be subsequently referred to as the SMARTPHONE WEARABLE 1.0 Dataset.


## Information

- Git Repository - https://github.com/jromania-sykes/cleaning_data_course_project/blob/master/README.md

- Original Data set - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Files

- 'README.md' - this file.

- 'run_analysis.R' : The R language code file that will clean the files in the SMARTPHONE WEARABLE 1.0 Dataset and 
will create the the the 3 txt data files described below.

- 'tidy_data_wearable.txt' is the cleaned dataset.  See CodeBook.md for explicit definitions and intructions.
	 1. The subject and activity columns are added to end of the given 'Train' and 'Test' datasets.
	 2. The Train' and 'Test' datasets are merged into one combined dataset.
	 3. The row and column names are set to their descriptive names for the dataframe.
	 4. A new dataset is created with the standard devation and mean columns are from the dataset along with the activity and subject columns.
	 5. 'tidy_data_wearable.txt' is created with the dataframe from 4.

	 
- 'tidy_data_wearable_mean_by_subject.txt' - The mean of all the columns in tidy_data_wearable.txt aggregated by the 30 subjects.

- 'tidy_data_wearable_mean_by_activity.txt' - Is the mean of all the columns in tidy_data_wearable.txt aggregated by 6 activities.

- 'CodeBook.md' - Gives the instruction and describes the algorithm used to transform the SMARTPHONE WEARABLE 1.0 Dataset into 

-  UCI HAR Dataset - This directory is a place holder for the original dataset.  The code 
	references files in this directory to perform the cleaning of the data.  To reproduce the transformation in run_analysis.R first download and extract the files into a directory with this name.
	

###Algorithms

####get_tidy_wearables

Transform the source tables into a tidy data set as defined by..

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set.
4. Labels the data set with descriptive variable names. 

####method

- Load global tables : activity_labels, features.
- Load 'train' and 'test' data sets.  X_test, Y_test, X_train, Y_train.
- Set column names for X_train and X_test to for the 561 measurements included in each sample (i.e.  Column names).
- Add the activity and subject columns to the X_train and X_test tables.  This adds the subject who was begin measured and the activity they were performing when the measurement was taken.
- Combine the the Test and Train tables into the combined_test_train data frame.
- As per the instructions extract just the mean and std columns (leaving the activity and subject columns) from the combined_test_train into the mean_std_combined table.
- Strip funky characters out of the column names (IE, '(','(','-',..) these cause problems with the dplyr specification used for the summary tables created 
- Return cleaned dataframe.

####get_tidy_mean_by_activity_wd

- Takes the data frame returned from get_tidy_wearables and returns a second, independent tidy data set with the average of each variable for each activity.

 
####get_mean_by_subject_wd <- function(mean_std_combined) 
- Takes the data frame returned from get_tidy_wearables and returns a second, independent tidy data set with the average of each variable for each subject.


