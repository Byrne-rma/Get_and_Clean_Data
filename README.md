#### README.md 
Course Project for Getting and Cleaning Data, July 2015

The script *run_analysis.R* assumes that: 

* Packages *'readr'* and *'dplyr'* are already installed
* the data files are already unzipped and the working directory is set
to the *'UCI HAR Dataset'* folder

The script has the following steps:

*  Read the 8 text files in the training and test data sets using `read.table()`
*  Combine the 3 text files for each data set using `bind_cols()`
*  Merge both data sets using `bind_rows()`
*  Identify which names in the *'features'* file contain the words *'mean'* or *'std'* using `grep() `  
*  Clean the corresponding feature labels by removing all parentheses and the word "Body" that is  
repeated in some of the original labels, using `gsub()`
*  Extract the *'subject'*, *'activity'* and *'contains mean or std'* columns using `select()`  
*  Assign the labels from the *'activity_labels'* file to the corresponding codes in the *'activity'* column  
of the merged data set by subsetting `merged_data[]<-`
*  Assign descriptive variable names to the *'contains mean or std'* columns  using the corresponding  
labels from the *'features'* file with `names()<-`  
*  Find the average of each variable for each activity and each subject using `group_by()`,  
`summarise_each(funs(mean))` and the chain operator `%>%` 	
	*  All the variable names are the same as the *'features'* labels in the original data set.  Since all  
	the values in the new data set are averages, there was no need to modify the labels.
*  Write the new data set to a text file using `write.table()`  
	*  One way to read the tidy data set into R is `read.table()`:  
	  `read.table("Average_by_subject_and_activity.txt", header= TRUE)`
          
    