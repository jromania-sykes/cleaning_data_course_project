
##Code book for Course project for the Getting and Cleaning Data

Files


####Original Data set - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Refer to the documentation above for description of the source files.

###Source Data

- activity_labels : Name mapping for activities performed by the subjects.  (1 WALKING
2 WALKING_UPSTAIRS..for example).

- features - A table of column names for the measurments taken.  (tBodyAcc-XYZ,
tGravityAcc-XYZ,tBodyAccJerk-XYZ)

- X_test - The measurement matrix for the 'Test' group.
- Y_test - Activity mapping for the data in X_test. 
subject_test - Mapping of the subject that was performing the activity for the measurement in X_test.


- X_train - The measurement matrix for the 'Train' group.
- Y_train - Activity mapping for the data in X_train. 
subject_train - Mapping of the subject that was performing the activity for the measurement in X_train.


get_tidy_wearables_data <- function() {
    ##load global tables
    library(dplyr)
    # friendly names for the six activities measured
    # setwd('./Downloads/UCI HAR Dataset/')
    
    # names for the 561 measurements included in each sample (i.e.  Column names)
    
    # load X_test this is the core measurement for test group
    X_test=read.table('./UCI HAR Dataset/test/X_test.txt')

    # set column lables before we start adding new columns

    colnames(X_test)<-features$V2

    #Add activity and activity label column. Y_test 
    Y_test=read.table('./UCI HAR Dataset/test/Y_test.txt')

    X_test$activity<-Y_test$v1
    X_test$activity_label<-activity_labels[Y_test$V1,]$V2

    #Add subject column. subject_test 
    subject_test=read.table('./UCI HAR Dataset/test/subject_test.txt')
    X_test$subject<-subject_test$V1
     
    # load X_train this is the core measurement for train group
    X_train=read.table('./UCI HAR Dataset/train/X_train.txt')

    # set column lables before we add activity columns
    colnames(X_train)<-features$V2

    #Add activity and activity label column. Y_test 
    Y_train=read.table('./UCI HAR Dataset/train/Y_train.txt')

    X_train$activity<-Y_train$v1
    X_train$activity_label<-activity_labels[Y_train$V1,]$V2

    #Add subject column. subject_train
    subject_train=read.table('./UCI HAR Dataset/train/subject_train.txt')
    X_train$subject<-subject_train$V1

    #combine into one dataframe
    combined_test_train<-rbind(X_test,X_train)

    
    #extract just the mean and std columns 
    mean_std_combined<-cbind(combined_test_train[,grep('std',colnames(combined_test_train))],combined_test_train[,grep('mean',colnames(combined_test_train))])

    mean_std_combined$activity=combined_test_train$activity_label
    mean_std_combined$subject=combined_test_train$subject

    cnames = colnames(mean_std_combined)
    cnames = gsub('-','',cnames)
    cnames = gsub('\\(\\)','',cnames)

    #Add subject column. subject_train
    
    colnames(mean_std_combined) <- cnames
    mean_std_combined
    
}

get_tidy_mean_by_activity_wd <- function(mean_std_combined) {
    mean_by_activity=mean_std_combined %>% group_by(activity) %>% summarise_each(funs(mean(.,na.rm=TRUE)), -subject)
    }

get_mean_by_subject_wd <- function(mean_std_combined) {
    mean_by_subject =mean_std_combined %>% group_by(subject)  %>% summarise_each(funs(mean(.,na.rm=TRUE)), -activity)
}


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

load global tables
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

