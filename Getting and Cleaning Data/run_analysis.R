
#load the data from train and test
activitytrain <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\train\\y_train.txt")
activitytest <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\test\\y_test.txt")

subjecttrain <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\train\\subject_train.txt")
subjecttest <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\test\\subject_test.txt")

Featuretrain <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\train\\X_train.txt")
Featuretest <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\test\\X_test.txt")

#Merge the training and the test sets to create one data set.
datafeature <- rbind(Featuretrain,Featuretest)
datasubject <- rbind(subjecttrain,subjecttest)
dataactivity <- rbind(activitytrain,activitytest)


#Extract only the measurements on the mean and standard deviation for each measurement.

Features<- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\features.txt")
mean_std_features <- grep("-(mean|std)\\(\\)",Features$V2) # get only columns with mean() or std() in their names
data <- datafeature[,mean_std_features] # subset the desired columns

names(data) <- Features[mean_std_features,2] # correct the column names
names(dataactivity) <- c("activity")         # give name to activity dataset
names(datasubject) <- c("subject")           # give name to subject dataset
all_data <- cbind(data,datasubject,dataactivity) #combining the data set of activity and subject

#Using descriptive activity names to name the activities in the data set
#Appropriately labelling the data set with descriptive variable names
activitylabels <- read.table("C:\\Users\\ppga\\Documents\\R\\UCI HAR Dataset\\activity_labels.txt")
all_data$activity <- factor(x = all_data$activity, labels = activitylabels[,2])
names(all_data)<-gsub("^t", "time", names(all_data))
names(all_data)<-gsub("^f", "frequency", names(all_data))
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
names(all_data)<-gsub("BodyBody", "Body", names(all_data))

# creating a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_data, "avg_data.txt", row.name=FALSE)