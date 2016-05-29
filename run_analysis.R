library(dplyr)
#Download and Unzip data(in case they are not already present)
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(URL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
#Read train and test data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
#Read descriptive data (activities,subjects,features)
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("index","label"),stringsAsFactors=FALSE)
features <- read.table("UCI HAR Dataset/features.txt",col.names=c("index","feature"),stringsAsFactors=FALSE)
#Only keep features of interest(mean/std)
features<- subset(features,grepl("*.mean|*.std",features$feature))
#Add activities and subjects to the test & train data and name the columns properly
colnames(test_data)=features$feature
colnames(train_data)=features$feature
colnames(train_subjects)="Subject"
colnames(train_activities)="Activity"
colnames(test_subjects)="Subject"
colnames(test_activities)="Activity"
test_data <- cbind(test_subjects, test_activities, test_data)
train_data <- cbind(train_subjects, train_activities, train_data)
#Merge train and test data
combination<-rbind(train_data,test_data)
#Keep only useful fields from data(Subject,Activity and the features we kept)
kept_data<-subset(combination, select=c("Subject","Activity",features$feature))
#Change Activity from Value to Name
kept_data$Activity<-factor(kept_data$Activity)
levels(kept_data$Activity)<-labels[,2]
#Create the new data set containing means for each Activity-Subject combination
tidy_set <-kept_data %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean(., na.rm=TRUE)))
#Print the Dataset
write.table(tidy_set, "mean.rds")



