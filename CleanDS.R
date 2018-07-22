feature_path<-list.files(path=target_path, pattern="labels.txt|features.txt")
train<-"train"
train_path<-list.files(path=paste(target_path, train, sep="/"), pattern="*.txt")
test<-"test"
test_path<-list.files(path=paste(target_path, test, sep="/"), pattern="*.txt")

GetFeatures<-function(features)
{
  features_p<-features[grep("mean\\(\\)|std\\(\\)", features$V2),]
  rm(features)
  features_p$V2<-gsub("\\(\\)","",features_p$V2)
}

GetActivity<-function(activities)
{
  print("read activity_labels")
  
  activity_path<- paste(target_path, "activity_labels.txt", sep="/")
  
  activity<-read.table(activity_path)	
}

ReformDataSet<-function(category, file_paths, ftable,atable)
{
  print(paste("read", category, "table...", sep=" "))
  for (p in file_paths)
  {
    path<-paste(target_path, category, p, sep="/")
    tname<-gsub(".txt", "", p)
    if ("subject" %in% tname)
    {	
      tsubject<-ReadTable(path, tname)
      names(tsubject)<-c("Subject")
    }
    else if ("y" %in% tname)
    {
      ty<-ReadTable(path, tname)
      names(ty)<-c("Activity")
      ty$Activity<-factor(ty$Activity, levels=atable$V1, lables=atable$V2)
    }
    else if ("x" %in% tname)
    {
      tx<-ReadTable(path, tname)
      tx_ds<tx[,ftable$V1]
      rm(tx)
      names(tx_ds)<ftable$V2
    }
  }
  ds_combined<-cbind(tsubject, cbind(ty, tx))
}

ReadTable<-function(path, tname)
{
  print(paste("read", tname, "table from", path, sep=" "))
  tname<-read.table(path)
}