##Introduction to Run_analysis.R script
The aim of this R script is to create a dataset which contains means and standard deviations of important features collected from the accelerometers from the Samsung Galaxy S smartphone. It uses the raw data sets on activity labels, feature information, subject id and a set of variables that were estimated from the feature vector.

## Steps to create the final data set. 
* Read in all the data sets: activity_label, features, subject_train, X_train, y_train, subject_test, X_test, y_test.
* Assign column names to each of the above data frame.
* Merge the train and test data sets to create the complete data set.
* Extract the mean and standard deviation for each measurement (the following analysis only worked on these variables)
* Use descriptive activity names to name activities in the data set.
* Change the names of the variables so that the new names are more descriptive
* Create a new data set that contains the average values of the measurement variables for each subject and activity combination.
* Output a data set with text format called "tidydata.txt".