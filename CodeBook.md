
##Code book for Course project for the Getting and Cleaning Data

Files


####Original Data set - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Refer to the documentation above for description of the source files.

###Source Data
The following tables are loaded from the dataset listed above.  Please review the information in the above dataset for more detail on the source data and project.

- activity_labels - Name mapping for activities performed by the subjects.  (1 WALKING
2 WALKING_UPSTAIRS..for example).

- features - A table of column names for the measurments taken.  (tBodyAcc-XYZ,
tGravityAcc-XYZ,tBodyAccJerk-XYZ)

- X_test - The measurement matrix for the 'Test' group.
- Y_test - Activity mapping for the data in X_test. 
subject_test - Mapping of the subject that was performing the activity for the measurement in X_test.

- X_train - The measurement matrix for the 'Train' group.
- Y_train - Activity mapping for the data in X_train. 
subject_train - Mapping of the subject that was performing the activity for the measurement in X_train.

###Alogorithm

The following steps are performed by get_tidy_wearables data function in the 
run_analysis.R.

- load global tables : activity_labels, features,
- load 'train' and 'test' data sets.  X_test, Y_test, X_train, Y_train
- set column names for X_train and X_test to for the 561 measurements included in each sample (i.e.  Column names)
- Add the activity and subject columns to the X_train and X_test tables.  This adds the subject who was begin measured and the activity they were performing when the measurement was taken.
- combine the the Test and Train tables into the combined_test_train data frame.
- As per the instructions extract just the mean and std columns (leaving the activity and subject columns) from the combined_test_train into the mean_std_combined table.
- strip funky characters out of the column names (IE, '(','(','-',..) these cause problems with the dplyr specification used for the summary tables created 

get_tidy_mean_by_activity_wd <- function(mean_std_combined) {
    mean_by_activity=mean_std_combined %>% group_by(activity) %>% summarise_each(funs(mean(.,na.rm=TRUE)), -subject)
    }

get_mean_by_subject_wd <- function(mean_std_combined) {
    mean_by_subject =mean_std_combined %>% group_by(subject)  %>% summarise_each(funs(mean(.,na.rm=TRUE)), -activity)
}

