# Final Project for Reading and Cleaning data
# Date: May 14, 2016

#Precondition: Zip file already exists locally and files extracted

#Set working directory to read project files
setwd("C:/Users/Irian/My Work/Data Scientist/Getting and Cleaning data/data/Final Project/UCI HAR Dataset")

#Read names of the activiy and the function calculated based on the data
activityLabels <- read.table("activity_labels.txt")
colnames(activityLabels) <- c("ActivityID","ActivityName")

features <- read.table("features.txt")

#Read files with training data (x= data recorded from each volunteer, 
# y = activity (1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING)) and 
# subject identifier (volunteer identification) i.e. 1 - 30

xtrain_data <- read.table("train/X_train.txt")
ytrain_data <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Label the columns of data with the names of the actual calculations performed
colnames(xtrain_data) <- features$V2 
colnames(ytrain_data) <- ("ActivityID")
colnames(subject_train) <- ("VolunteerID")


#Merge train data to include volunteer id, activity performed and data collected
merge_train <- cbind(subject_train, ytrain_data, xtrain_data)

#Read files with test data (x= data recorded from each volunteer, 
# y = activity (1-WALKING, 2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING)) and 
# subject identifier (volunteer identification) i.e. 1 - 30

xtest_data <- read.table("test/X_test.txt")
ytest_data <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Label the columns of data with the actual calculations performed
colnames(xtest_data) <- features$V2 
colnames(ytest_data) <- ("ActivityID")
colnames(subject_test) <- ("VolunteerID")

#Merge test data to include volunteer id, activity performed and data collected
merge_test <- cbind(subject_test, ytest_data, xtest_data)

#Create one data set with train and test data
oneset <- rbind(merge_train, merge_test)

#Get names of the columns
columnNames <- names(oneset)

#Review names of all columns and create a logical vector checking for mean and standard deviation 
mean_and_std <- (grepl("ActivityID" , columnNames) | 
                 grepl("VolunteerID" , columnNames) | 
                 grepl("mean.." , columnNames) | 
                 grepl("std.." , columnNames))

#Create a set with data containing only means and standard deviations
meanAndstdValues <- oneset[ , mean_and_std == TRUE]

#Add Names of the activities to the data set (1-WALKING, 2-WALKING_UPSTAIRS, 
#                                            3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING)
WithActivityNames <- merge(meanAndstdValues, activityLabels, by ='ActivityID', all.x=TRUE)

#Create a new data set
cleanSet <- aggregate(. ~VolunteerID + ActivityID, WithActivityNames, mean)
cleanSet <- cleanSet[order(cleanSet$VolunteerID, cleanSet$ActivityID),]

#Create a new file in working directory
write.table(cleanSet, "cleanSet.txt", row.name=FALSE)


