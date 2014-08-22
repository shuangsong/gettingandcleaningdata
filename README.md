Introduction 
------
This project uses UCI HAR Dataset to prepare tidy data for later use. The repo contains a code book, run_analysis.R , README.md and a file with txt version.  The code book describes variables, data, and the transforming work I did to clean up the data; the .R file is code for how to get tidy data; README.md describes how these scripts work together; and a txt file is the final tidy data txt file.

Steps of cleaning data
----------
* Merges the training and the test sets to create one data set. 
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* Then saved as run_analysis.R

Methods
-----------
Unzip the raw data and read data use read.table() command, assign names to data, and use rbind() and cbind() to combine them and devide them into parts. Also, by using gsub() command to replace or delete names of the data. After I combined data I saved one txt file, the first tidy data set file called tidy named data(cleaned variable names in it) and then after create independent tidy data set with average of each variable for each activity and each subject I saved tidyMeans data.txt file.

Script information
------------
* run_analysis.R is codes run commands and get tidy data.
* README.md  is the instruction of the project.
* tidyMeans data.txt is tidy data created in procedure 5.(This is what we want in procedure 5)
* codebook contains variables, transformation method, information about the data.
* tidy named data.txt is the first tidy data created. 
Summary
----------
The code book will talks about variables, data, and transformation work.
