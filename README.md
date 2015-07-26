# cleaning_data_course_project

This is a course project for the Getting and Cleaning Data Coursera course by John Hopkins University.

Human Activity Recognition Using Smartphones Dataset
Version 1.0.  This will be subsequently refereed to as the SMARTPHONE WEARABLE 1.0 Dataset.

this original dataset can be found here.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


This project uses the following files
=========================================

- 'README.md' - this file.

- 'run_analysis.R' : Code file that will clean the files in theSMARTPHONE WEARABLE 1.0 Dataset and 
will create the the the 3 csv files described below.

- 'tidy_data_wearable.csv' is the cleaned dataset.  
	 ##The subject and activity columns are added to the Train and Test datasets.
	 ##The datasets are merged into one large dataset.
	 ##The actual row and column names are set to their descriptive names for the dataframe.
	 ##The standard devation and mean columns are extracted
	 
	 
- 'tidy_data_wearable_mean_by_subject.csv'
	##Is the mean of all the columns in tidy_data_wearable aggregated by the 30 subjects.

- 'tidy_data_wearable_mean_by_activity.csv''
##Is the mean of all the columns in tidy_data_wearable aggregated by 6 activities.


- 'CodeBook.md' - describes the algoritmn used to transform the MARTPHONE WEARABLE 1.0 Dataset into 

-  UCI HAR Dataset - This directory is a place holder for the original dataset.  The code 
	references files in this directory to perform the cleaning of the data.  To reproduce the transformation in run_analysis.R first downloand and exgtract the files into a directory with this name.
	

