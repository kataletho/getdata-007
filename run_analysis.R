# This script generates a summary dataset containing the average mean and 
# standard deviation values across a series of measurements by subject and
# activity based on data from a phone's accelerometer and gyroscope.

library(data.table)

# Read the feature data, so it can be used to create headers for the 
# data as it is read from the X_...txt files.
features = read.table("UCI HAR Dataset/features.txt")

# 1. Merge the training and the test sets to create one data set
# subject_*.txt contains the subject ids
# Y_*.txt contains the activity ids
# X_*.txt contains the measurement data
all_data <- rbind(
    cbind(
        read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject"),
        read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "Activity.ID"),
        read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2)),
    cbind(
        read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject"),
        read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "Activity.ID"),
        read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$V2)))

# 2. Extract only the measurements on the mean and standard deviation for each measurement
# by finding the features that represent the mean and standard deviation measurements,
# then filtering the data to only include those measurements.
mean_and_std_features <- features[grepl("mean\\(\\)", features$V2, ignore.case = TRUE) | 
                                  grepl("std\\(\\)", features$V2, ignore.case = TRUE), ]
mean_and_std_columns <- gsub("[\\(\\)\\-]", ".", mean_and_std_features$V2)
# Note: when the features are used as column names, the round brackets and -
# are replaced with periods, To filter the columns, the same conversion is required.
mean_and_std_data <- subset(all_data, select = c("Subject", "Activity.ID", mean_and_std_columns))

# 3. Use descriptive activity names to name the activities in the data set
# using the activity names from the activity label file.
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
merged_data <- merge(mean_and_std_data, activity_labels, by.x = "Activity.ID", by.y = "V1")

# 4. Appropriately label the data set with descriptive variable names. 
# Note - the measurement columns have already been given descriptive names, 
# but make the Activity column name more readable
tidy_data <- subset(merged_data, select = c("Subject", "V2", mean_and_std_columns))
colnames(tidy_data) <- c("Subject", "Activity", mean_and_std_columns)

# 5. From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
summarized_data <- aggregate(subset(tidy_data, select = c(mean_and_std_columns)),
                             list(Activity = tidy_data$Activity, Subject = tidy_data$Subject), mean)

# # Write the data to a text file
write.table(summarized_data, file="summarized_data.txt", row.name=FALSE)
