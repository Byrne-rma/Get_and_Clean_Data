#  run_analysis.R        
#  Course Project for Getting and Cleaning Data, July 2015

library(readr)
library(dplyr)

#  Read training and test data sets
#  Assumes that the files are already unzipped and the working directory is set
#  to the "UCI HAR Dataset" folder

activity_names <- read.table( "activity_labels.txt")
features <- read.table( "features.txt")

#  Name the subject and activity columns when reading the files, to prevent 
#  confusion with the "V1" columns in "x_stats_train" and "x_stats_test" 
subj_train <- read.table( "train/subject_train.txt", col.names = "subject")
y_activ_train <- read.table( "train/y_train.txt", col.names = "activity") 
x_stats_train <- read.table( "train/X_train.txt")

subj_test <- read.table( "test/subject_test.txt", col.names = "subject")
y_activ_test <- read.table( "test/y_test.txt", col.names = "activity") 
x_stats_test <- read.table( "test/X_test.txt") 

#  Combine the subject, activity and summary value files for each data set 
subj_activ_stats_train <- bind_cols(subj_train,y_activ_train,x_stats_train)
subj_activ_stats_test <- bind_cols(subj_test,y_activ_test,x_stats_test)

#  Merge data sets
merged_train_test <- bind_rows(subj_activ_stats_train,subj_activ_stats_test)

#  Find which features contain means and standard deviations, and increase the 
#  index by 2 to account for the subject and activity columns in "merged_train_test"
mean_sdev_col_index <- grep("mean|std", features$V2, value = FALSE) + 2

# Extract columns that contain means and standard deviations
merged_mean_sdev <- select(merged_train_test, subject, activity, mean_sdev_col_index )

#  Assign descriptive activity names
merged_mean_sdev$activity[ merged_mean_sdev$activity == 1]  <- "WALKING"
merged_mean_sdev$activity[ merged_mean_sdev$activity == 2]  <- "WALKING_UPSTAIRS"
merged_mean_sdev$activity[ merged_mean_sdev$activity == 3]  <- "WALKING_DOWNSTAIRS" 
merged_mean_sdev$activity[ merged_mean_sdev$activity == 4]  <- "SITTING"
merged_mean_sdev$activity[ merged_mean_sdev$activity == 5]  <- "STANDING"
merged_mean_sdev$activity[ merged_mean_sdev$activity == 6]  <- "LAYING"
 
#  Assign descriptive variable names using the feature names 
mean_sdev_col_names <- grep("mean|std", features$V2, value = TRUE)
names(merged_mean_sdev) <- c( 'subject' , 'activity' , mean_sdev_col_names)

# Find the average of each variable for each activity and each subject
Average_by_subject_and_activity <-  merged_mean_sdev %>%
                group_by( subject , activity ) %>%
                summarise_each(funs(mean))

#  Write the new data set to a txt file
write.table(Average_by_subject_and_activity,"Average_by_subject_and_activity.txt",row.name=FALSE )
