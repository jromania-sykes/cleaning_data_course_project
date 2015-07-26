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
	

