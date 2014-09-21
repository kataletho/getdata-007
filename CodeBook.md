# CodeBook

## Data Processing

The summarized dataset was generated as follows:

1. The columns from the subject_*.txt, Y_*.txt and X_*.txt files were combined to create training and test datasets, which were then combined to create an overall dataset. As part of this step, the features.txt file was used to provide column headings for the measurements.
2. Any measurement columns that did not contain mean() or std() were removed.
3. The activity ids were replaced with activity names by merging the dataset with the data from the activity_labels file.
4. The V2 column was renamed to Activity for readability.
5. The data was then grouped by Activity and Subject, and each measurement was averaged.
6. Finally, the data was writtten to file - summarized_data.txt.

## Summarized Data Contents

"Activity" - The name of the activity (e.g. "LAYING", "SITTING").
"Subject" - The id of the test subject. Obtained from the Y_test.txt & Y_train.txt files.

The features_info.txt file describes the following data. However, it should be noted that all values have been averaged by Activity and Subject.
"tBodyAcc.mean...XYZ"
"tBodyAcc.std...XYZ"
"tGravityAcc.mean...XYZ"
"tGravityAcc.std...XYZ"
"tBodyAccJerk.mean...XYZ"
"tBodyAccJerk.std...XYZ"
"tBodyGyro.mean...XYZ"
"tBodyGyro.std...XYZ"
"tBodyGyroJerk.mean...XYZ"
"tBodyGyroJerk.std...XYZ"
"tBodyAccMag.mean.."
"tBodyAccMag.std.."
"tGravityAccMag.mean.."
"tGravityAccMag.std.."
"tBodyAccJerkMag.mean.."
"tBodyAccJerkMag.std.."
"tBodyGyroMag.mean.."
"tBodyGyroMag.std.."
"tBodyGyroJerkMag.mean.."
"tBodyGyroJerkMag.std.."
"fBodyAcc.mean...XYZ"
"fBodyAcc.std...XYZ"
"fBodyAccJerk.mean...XYZ"
"fBodyAccJerk.std...XYZ"
"fBodyGyro.mean...XYZ"
"fBodyGyro.std...XYZ"
"fBodyAccMag.mean.."
"fBodyAccMag.std.."
"fBodyBodyAccJerkMag.mean.."
"fBodyBodyAccJerkMag.std.."
"fBodyBodyGyroMag.mean.."
"fBodyBodyGyroMag.std.."
"fBodyBodyGyroJerkMag.mean.."
"fBodyBodyGyroJerkMag.std.."
