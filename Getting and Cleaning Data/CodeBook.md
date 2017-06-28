# Introduction
The script run_analysis.Rperforms the 5 steps described in the course project's definition.
- First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities. 
- Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
- As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
- On the whole dataset, those columns with vague column names are corrected.
- Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

# Variables and procedure

- Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”
- values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"
- Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”
- Names of Varibles Features come from “features.txt”
- levels of Varible Activity come from “activity_labels.txt”
- activitytrain, activitytest, subjecttrain, subjecttest, Featuretrain, Featuretest,  contain the data from the downloaded files.
- datafeature, datasubject, dataactivity are dataset formed by merging the previous datasets for further analysis.
- features contains the correct names for the datafeature dataset, which are applied to the column names stored in mean_std_features, a numeric vector used to extract the desired data and stored in a dataset called data.
- A similar approach is taken with activity names through the activities variable.
- all_data merges data, datasubject and dataactivity in a big dataset.
- Finally, avg_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development. 

