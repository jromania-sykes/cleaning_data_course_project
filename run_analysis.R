Data science Course project Notes

##load global tables
library(dplyr)
# friendly names for the six activities measured
setwd('Downloads/UCI HAR Dataset/')
activity_labels=read.table('activity_labels.txt')

# names for the 561 measurements included in each sample (i.e.  Column names)
features=read.table('features.txt')

# load X_test this is the core measurement for test group
X_test=read.table('test/X_test.txt')

# set column lables before we start adding new columns

colnames(X_test)<-features$V2

#Add activity and activity label column. Y_test 
Y_test=read.table('test/Y_test.txt')

X_test$activity<-Y_test$v1
X_test$activity_label<-activity_labels[Y_test$V1,]$V2

#Add subject column. subject_test 
subject_test=read.table('test/subject_test.txt')
X_test$subject<-subject_test$V1
 
# load X_train this is the core measurement for train group
X_train=read.table('train/X_train.txt')

# set column lables before we add activity columns
colnames(X_train)<-features$V2

#Add activity and activity label column. Y_test 
Y_train=read.table('train/Y_train.txt')

X_train$activity<-Y_train$v1
X_train$activity_label<-activity_labels[Y_train$V1,]$V2

#Add subject column. subject_train
subject_train=read.table('train/subject_train.txt')
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


mean_by_activity=mean_std_combined %>% group_by(activity) %>% summarise_each(funs(mean(.,na.rm=TRUE)), -subject)
mean_by_subject=mean_std_combined %>% group_by(subject) %>% summarise_each(funs(mean(.,na.rm=TRUE)), -activity)

