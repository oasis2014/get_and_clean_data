##Helper Functions

#Get source data
DownloadSourceData <- function(url)
{
  print("download data and unzip the package...")
  s_file<-"sourcedata.zip"
  
  if (!file.exists(s_file))
    download.file(url, s_file, mode="wb")
  
  f<-unzip(s_file)
}

#Do the project
library(reshape2)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target_path <- "./UCI HAR Dataset"

#Download the project data and extract it to the target_path
DownloadSourceData(url)

print(paste("current directory", getwd(), sep=":"))

#Read source data
print("read features")
features_path<- paste(target_path, "features.txt", sep="/")
features <-read.table(features_path)

print("read activity_labels")
activity_path<- paste(target_path, "activity_labels.txt", sep="/")
activity<-read.table(activity_path)

print("read subject_train")
sub_train_path <-paste(target_path, "train/subject_train.txt", sep="/")
sub_train<-read.table(sub_train_path)
names(sub_train)<-c("Subject")

print("read X_train")
x_train_path <-paste(target_path, "train/X_train.txt", sep="/")
x_train<-read.table(x_train_path)

print("read Y_train")
y_train_path <-paste(target_path, "train/Y_train.txt", sep="/")
y_train<-read.table(y_train_path)
names(y_train)<-c("Activity")

print("read subject_test")
sub_test_path <-paste(target_path, "test/subject_test.txt", sep="/")
sub_test<-read.table(sub_test_path)
names(sub_test)<-c("Subject")

print("read X_test")
x_test_path <-paste(target_path, "test/X_test.txt", sep="/")
x_test<-read.table(x_test_path)

print("read Y_test")
y_test_path <-paste(target_path, "test/Y_test.txt", sep="/")
y_test<-read.table(y_test_path)
names(y_test)<-c("Activity")

#Process source data
print("Process features file")
features_p<-features[grep("mean\\(\\)|std\\(\\)", features$V2),]
features_p$V2<-gsub("\\(\\)","",features_p$V2)
rm(features)

print("Extract only the mean and std from X_train and X_test")
x_train_ds <- x_train[,features_p$V1]
names(x_train_ds)<-features_p$V2
rm(x_train)

x_test_ds <- x_test[, features_p$V1]
names(x_test_ds)<-features_p$V2
rm(x_test)

print("Get train activity")
y_train$Activity<-factor(y_train$Activity, levels=activity$V1, labels=activity$V2)

print("Get test activity")
y_test$Activity<-factor(y_test$Activity, levels=activity$V1, labels=activity$V2)

print("Bind train data")
train_ds <-cbind(sub_train, cbind(y_train, x_train_ds))
test_ds <- cbind(sub_test, cbind(y_test, x_test_ds))
rm(y_train, sub_train, x_train_ds, sub_test, y_test, x_test_ds)

print("Combine train and test data")
all_ds<-rbind(train_ds, test_ds)
rm(train_ds, test_ds)

print("Reshape the dataset")
all_ds_v<-melt(all_ds, id=c("Subject", "Activity"))
all_ds_h<-dcast(all_ds_v, Subject+Activity ~ variable, mean)
rm(all_ds, all_ds_v)

print("Output the dataset to a txt file")
write.table(all_ds_h, "result.txt", row.names=FALSE, quote=FALSE)
