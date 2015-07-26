# cleaning_data_course_project
This project is a course project to clean the data provided by the 
Human Activity Recognition Using Smartphones Dataset
Version 1.0

the original dataset can be found here.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This project uses the following files
=========================================

- 'README.md'

- 'run_analysis.R' : Code file that will take files in the UCI HAR Dataset and 
will create the the the 3 csv files described below 

- 'tidy_data_wearable.csv' is the cleaned dataset.  

it represents.
The merged the training and the test sets data.  the 
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


    ##load global tables
    # friendly names for the six activities measured
    # setwd('./Downloads/UCI HAR Dataset/')

    # names for the 561 measurements included in each sample (i.e.  Column names)

    # load X_test this is the core measurement for test group

    # set column lables before we start adding new columns


    #Add activity and activity label column. Y_test 


    #Add subject column. subject_test 
     
    # load X_train this is the core measurement for train group

    # set column lables before we add activity columns

    #Add activity and activity label column. Y_test 

    #Add subject column. subject_train

    #combine into one dataframe

    #extract just the mean and std columns 



    #Add subject column. subject_train


get_tidy_mean_by_activity_wd <- function(mean_std_combined) {
    mean_by_activity=mean_std_combined %>% group_by(activity) %>% summarise_each(funs(mean(.,na.rm=TRUE)), -subject)
    }

get_mean_by_subject_wd <- function(mean_std_combined) {
    mean_by_subject =mean_std_combined %>% group_by(subject)  %>% summarise_each(funs(mean(.,na.rm=TRUE)), -activity)
}
