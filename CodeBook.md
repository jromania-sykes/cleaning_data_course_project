

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

