library(dplyr)

#Download and unzip data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"rawdata.zip")
unzip("rawdata.zip")

#Change working directory
setwd(paste(getwd(), "/UCI HAR Dataset", sep = ""))

#Extract features file to get descriptive feature names
features<-read.table("features.txt")

#Extract activity_labels file to get descriptive activity labels
activity_labels<-read.table("activity_labels.txt")

#Extract data from train
subject_train<-read.table("train/subject_train.txt", col.names = c("subject"), stringsAsFactors = FALSE)
label_train<-read.table("train/y_train.txt", col.names = c("activity"), stringsAsFactors = FALSE)
#change label data from code to activity
label_train1<-sapply( label_train, function(x) {as.vector(activity_labels$V2)[x]})
#while extracting data_train, change headers to descriptive column names as per feature file
data_train<-read.table("train/x_train.txt", col.names = as.vector( features$V2 ), stringsAsFactors = FALSE)
train<-cbind(subject_train, label_train1, data_train)

#Extract data from test
subject_test<-read.table("test/subject_test.txt", col.names = c("subject"), stringsAsFactors = FALSE)
label_test<-read.table("test/y_test.txt", col.names = c("activity"), stringsAsFactors = FALSE)
#change label data from code to activity
label_test1<-sapply( label_test, function(x) {as.vector(activity_labels$V2)[x]})
#while extracting data_test, change headers to descriptive column names as per feature file
data_test<-read.table("test/x_test.txt", col.names = as.vector( features$V2 ), stringsAsFactors = FALSE)
test<-cbind(subject_test, label_test1, data_test)

#Merge train and test datasets
data<-rbind(train, test)

#Select columns with mean.. or std..
data1<-data[grepl( "subject|activity|mean\\..|std\\..", names(data))]

#Get average of each variable for each subject and activity combination
summary<- data1 %>% group_by( subject, activity ) %>% summarize_all( mean )

#Write output to file
write.table( summary, "summary.txt", row.names = FALSE)