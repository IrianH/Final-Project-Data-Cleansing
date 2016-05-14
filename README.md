May 14, 2016
Description of Data Cleansing for Final Project

The project deliverables includes the following files:
=========================================

- 'README.txt'

- 'ProjectScript.R

- 'Code Book'

Description of activities performed:

1- The following project files were downloaded, extracted and read to start data cleansing:
 - "activity_labels.txt"
 - "features.txt"
 - "X_train.txt"
 - "y_train.txt"
 - "subject_train.txt"
-  "X_test.txt"
 - "y_test.txt"
 - "subject_test.txt"


2- Read names of the activities from file"activity_labels.txt" and labeled the data to make it easier to understand the data
3- Read files with training data "X_train.txt" and "x_test" for each subject (1..30) and with data for activities (1..6) or 
              (1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING))
4- Read file with identifier for the six activities (y_train.txt and y_test.txt)
5- Read file "features.txt" with type of analysis made with the collected data 
6- Read subject identifier or (volunteer identification) i.e. 1 - 30 for all observations

Steps to Merge data and Create a new tidy set

1- Merge train data to include volunteer id, activity performed and data collected
2- Merge test data to include volunteer id, activity performed and data collected
3- Create one data set with train and test data
4- Get names of the columns and review names of all columns and create a logical vector checking for mean and standard deviation 
5-Create a set with data containing only means and standard deviations
6- Add Names of the activities to the data set (1-WALKING, 2-WALKING_UPSTAIRS, 
                                             3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING)
7- Create a new tidy data set and save in a text file in the working directory




