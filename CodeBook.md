####  CodeBook.md  ####
Course Project for Getting and Cleaning Data, July 2015  
  

##### Description  
 
-  The data set has 180 values of 81 variables  
-  The first two variables identify the subject and activity, and the remaining 79 are the averages by subject and activity  
   of the Means and Standard Deviations present in the original data sets. The variable names are the same as the  
 original labels in `features.txt`. 
-  The new data set has 66 variables ending in `mean` or `std` and another 13 variables ending in `meanFreq`   
-  Variables listed below as "xxxx-X, -Y, and -Z" have three separate columns for X, Y and Z
-  All columns are in the same order as in the original data sets   
  

##### Operations performed to clean up the data ####
- All parentheses were removed from the variable names.  
- The labels of some of the variables in the original data sets had the word `Body` repeated, for example `fBodyBodyAccJerkMag-mean`,  
and were corrected to match the names shown in the third paragraph of the original `features_info.txt` file, where they are listed with only one `Body`. 

##### Variable Names

     Variable Name             |   Range of values  
    -------------------------- |---------------------------------------------------------------------   
     Subject 	               |   1 to 30  
     Activity                  |   WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
                               |   LAYING [copied from the original file, should be lying_down or reclining] 
     
     The range for the other 79 variables is -1 to l, because the original variables were normalized. 
     The names are listed below in rows, in the order of the columns, with means on the  left and  
     standard deviations on the right.  

     tBodyAcc-mean-X, -Y and -Z           tBodyAcc-std-X, -Y and -Z
     tGravityAcc-mean-X, -Y and -Z        tGravityAcc-std-X, -Y and -Z
     tBodyAccJerk-mean-X, -Y and -Z       tBodyAccJerk-std-X, -Y and -Z
     tBodyGyro-mean-X, -Y and -Z          tBodyGyro-std-X, -Y and -Z
     tBodyGyroJerk-mean-X, -Y and -Z      tBodyGyroJerk-std-X, -Y and -Z
     tBodyAccMag-mean                     tBodyAccMag-std
     tGravityAccMag-mean                  tGravityAccMag-std
     tBodyAccJerkMag-mean                 tBodyAccJerkMag-std
     tBodyGyroMag-mean                    tBodyGyroMag-std
     tBodyGyroJerkMag-mean                tBodyGyroJerkMag-std

     fBodyAcc-mean-X, -Y and -Z           fBodyAcc-std-X, -Y and -Z
     fBodyAcc-meanFreq-X, -Y and -Z
     fBodyAccJerk-mean-X, -Y and -Z       fBodyAccJerk-std-X, -Y and -Z
     fBodyAccJerk-meanFreq-X, -Y and -Z
     fBodyGyro-mean-X, -Y and -Z          fBodyGyro-std-X, -Y and -Z
     fBodyGyro-meanFreq-X, -Y and -Z
     fBodyAccMag-mean                     fBodyAccMag-std
     fBodyAccMag-meanFreq
     fBodyAccJerkMag-mean                 fBodyAccJerkMag-std
     fBodyAccJerkMag-meanFreq
     fBodyGyroMag-mean                    fBodyGyroMag-std
     fBodyGyroMag-meanFreq
     fBodyGyroJerkMag-mean                fBodyGyroJerkMag-std
     fBodyGyroJerkMag-meanFreq  
  