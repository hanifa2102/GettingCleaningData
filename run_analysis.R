fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,dest="data/fitness.zip")

#Manually unzip the files
# 1) Merges the training and the test sets to create one data set.
trainData <- read.table("./data/train/X_train.txt")
trainLabel <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")

testData <- read.table("./data/test/X_test.txt")
testLabel <- read.table("./data/test/y_test.txt") 
testSubject <- read.table("./data/test/subject_test.txt")

appendedData <- rbind(trainData, testData)
appendedLabel <- rbind(trainLabel, testLabel)
appendedSubject <- rbind(trainSubject, testSubject)

#2)Extracts only the measurements on the mean and standard deviation for 
#each measurement. 

features <- read.table("./data/features.txt")
meanStdIndexes <- grep("mean\\(\\)|std\\(\\)", features[, 2])
filtered.appendedData<-appendedData[,meanStdIndexes]

colnames<-features[meanStdIndexes, 2]
colnames<-gsub("-", "", colnames)
colnames<-gsub("mean","Mean",colnames)
colnames<-gsub("std","Std",colnames)

#3)Uses descriptive activity names to name the activities in the data set
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityLabel <- activity[appendedLabel[, 1], 2]
appendedLabel[, 1]<-activityLabel

#merged Data
mergedData <- cbind(appendedSubject,appendedLabel,appendedData)
dim(mergedData) # 10299*68
write.table(mergedData, "merged_data.txt") # write out the 1st dataset