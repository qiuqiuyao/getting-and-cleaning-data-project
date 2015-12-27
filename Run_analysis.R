## Read in all the data sets.
activitylabel<-read.table("activity_labels.txt",sep="",header=FALSE)
features<-read.table("features.txt",sep="",header=FALSE)
subject_train<-read.table("./train/subject_train.txt",sep="",header=FALSE)
x_train<-read.table("./train/X_train.txt",sep="",header=FALSE)
y_train<-read.table("./train/y_train.txt",sep="",header=FALSE)
subject_test<-read.table("./test/subject_test.txt",sep="",header=FALSE)
x_test<-read.table("./test/X_test.txt",sep="",header=FALSE)
y_test<-read.table("./test/y_test.txt",sep="",header=FALSE)

## Assign column names to each data frame.
colnames(activitylabel)<-c("activityid","activityname")
colnames(subject_train)<-"subjectid"
colnames(x_train)<-features[,2]
colnames(y_train)<-"activityid"
colnames(subject_test)<-"subjectid"
colnames(x_test)<-features[,2]
colnames(y_test)<-"activityid"

## Creating the final train and test datasets.
traindata<-cbind(subject_train,y_train,x_train)
testdata<-cbind(subject_test,y_test,x_test)

## Merge train and test data into one data frame.
finaldata<-rbind(traindata,testdata)

## Extract only the mean and standard deviation for each measurement.
meanstdindex<-grep(".*mean.*|.*std.*",features[,2])
extractindex<-meanstdindex+2
meanstddata<-finaldata[,c(1,2,extractindex)]

## Use descriptive activity names to name activities in the data set.
meanstddata$activityid<-factor(meanstddata$activityid,levels=activitylabel[,1],labels=activitylabel[,2])

## Appropriately labels the dataset with the descriptive variable names.
cnames<-colnames(meanstddata)
namedescriptive<-gsub("\\()","",cnames)
namedescriptive<-gsub("^(t)","time",namedescriptive)
namedescriptive<-gsub("^(f)","freq",namedescriptive)
colnames(meanstddata)<-namedescriptive

## Creating a new dataset which contains the average feature values for each subject and each activity.
library(reshape2)
datamelt<-melt(meanstddata,id=c("subjectid","activityid"))
tidydata<-dcast(datamelt,subjectid+activityid ~ variable,mean)

write.table(tidydata,"tidydata.txt",row.names=FALSE,quote=FALSE)


