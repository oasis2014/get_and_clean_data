#Code Book

##1. 68 Variables used in the tidy dataset
*  Subject                  : int, represents participants (1-30)
*  Activity                 : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",       "SITTING", "STANDING", "LAYING"

*The following variables represent Mean Value(mean) and Standard Deviation(std) of the body linear acceleration(tBodyAcc) , angular velocity vector measured by gyroscope(tBodygyro), Jerk signals(tBodyAccJerk and tBodyGyroJerk) by Subject and Activity. the details are in features.txt and Readme_raw.md coming from the raw data*

*  tBodyAcc-mean-X          : num  
*  tBodyAcc-mean-Y          : num  
*  tBodyAcc-mean-Z          : num  
*  tBodyAcc-std-X           : num  
*  tBodyAcc-std-Y           : num  
*  tBodyAcc-std-Z           : num 
*  tGravityAcc-mean-X       : num  
*  tGravityAcc-mean-Y       : num  
*  tGravityAcc-mean-Z       : num  
*  tGravityAcc-std-X        : num  
*  tGravityAcc-std-Y        : num  
*  tGravityAcc-std-Z        : num 
*  tBodyAccJerk-mean-X      : num  
*  tBodyAccJerk-mean-Y      : num  
*  tBodyAccJerk-mean-Z      : num  
*  tBodyAccJerk-std-X       : num  
*  tBodyAccJerk-std-Y       : num  
*  tBodyAccJerk-std-Z       : num  
*  tBodyGyro-mean-X         : num  
*  tBodyGyro-mean-Y         : num  
*  tBodyGyro-mean-Z         : num  
*  tBodyGyro-std-X          : num  
*  tBodyGyro-std-Y          : num  
*  tBodyGyro-std-Z          : num  
*  tBodyGyroJerk-mean-X     : num  
*  tBodyGyroJerk-mean-Y     : num  
*  tBodyGyroJerk-mean-Z     : num  
*  tBodyGyroJerk-std-X      : num  
*  tBodyGyroJerk-std-Y      : num  
*  tBodyGyroJerk-std-Z      : num  
*  tBodyAccMag-mean         : num  
*  tBodyAccMag-std          : num  
*  tGravityAccMag-mean      : num  
*  tGravityAccMag-std       : num  
*  tBodyAccJerkMag-mean     : num  
*  tBodyAccJerkMag-std      : num  
*  tBodyGyroMag-mean        : num  
*  tBodyGyroMag-std         : num  
*  tBodyGyroJerkMag-mean    : num  
*  tBodyGyroJerkMag-std     : num  
*  fBodyAcc-mean-X          : num  
*  fBodyAcc-mean-Y          : num  
*  fBodyAcc-mean-Z          : num  
*  fBodyAcc-std-X           : num  
*  fBodyAcc-std-Y           : num  
*  fBodyAcc-std-Z           : num  
*  fBodyAccJerk-mean-X      : num  
*  fBodyAccJerk-mean-Y      : num  
*  fBodyAccJerk-mean-Z      : num  
*  fBodyAccJerk-std-X       : num  
*  fBodyAccJerk-std-Y       : num 
*  fBodyAccJerk-std-Z       : num  
*  fBodyGyro-mean-X         : num  
*  fBodyGyro-mean-Y         : num  
*  fBodyGyro-mean-Z         : num  
*  fBodyGyro-std-X          : num  
*  fBodyGyro-std-Y          : num  
*  fBodyGyro-std-Z          : num  
*  fBodyAccMag-mean         : num  
*  fBodyAccMag-std          : num  
*  fBodyBodyAccJerkMag-mean : num  
*  fBodyBodyAccJerkMag-std  : num  
*  fBodyBodyGyroMag-mean    : num  
*  fBodyBodyGyroMag-std     : num  
*  fBodyBodyGyroJerkMag-mean: num  
*  fBodyBodyGyroJerkMag-std : num  

##2. Analysis Summary

To accomplish the requirment, first of all, subsetting the features data table by extracting only mean() and std() data. Then subsetting the X_train and X_test by the column number from features data table and replace the column names with the feature names of features data table. Secondly, replace the activity id in Y_train and Y_test data with the activity name of activity data table. Thirdly, bind X_train with Y_train and subject_train; bind X_test with Y_test and subject_test. Finally, combine both processed train and test data sets. In this way we got a tidy dataset ready to calculate the average value of of the mean and std. 


