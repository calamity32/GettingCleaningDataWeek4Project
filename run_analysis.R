#Jeff Gauzza
#2021/02/15

library(data.table)
library(dplyr)

setwd("C:/Users/Jeff/Desktop/Coursera/wk4")

#Download files, unzip & get date

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "wk4Data.zip"

if (!file.exists(destFile)){download.file(URL, destfile = destFile, mode='wb')}
if (!file.exists("./wk4data")){unzip(destFile)}

dateDownloaded <- date()

#Read files

actTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
featTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
actTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
featTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
featNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

#Merges the training and the test sets to create one data set

featData <- rbind(featTest, featTrain)
subData <- rbind(subTest, subTrain)
actData <- rbind(actTest, actTrain)

#Appropriately labels the data set with descriptive variable names

names(actData) <- "activityN"
names(actLabels) <- c("activityN", "activity")
act <- left_join(actData, actLabels, "activityN")[, 2]

names(subData) <- "subject"
names(featData) <- featNames$V2

data1 <- cbind(subData, act)
data1 <- cbind(data1, featData)

#Extracts only the measurements on the mean and standard deviation for each measurement

subfeatNames <- featNames$V2[grep("mean|std", featNames$V2)]
DataNames <- c("subject", "act", as.character(subfeatNames))
data1 <- subset(data1, select=DataNames)

#Uses descriptive activity names to name the activities in the data set

names(data1) <- gsub("^t", "Time", names(data1))
names(data1) <- gsub("^f", "Frequency", names(data1))
names(data1) <- gsub("Acc", "Accelerometer", names(data1))
names(data1) <- gsub("Gyro", "Gyroscope", names(data1))
names(data1) <- gsub("Mag", "Magnitude", names(data1))
names(data1) <- gsub("BodyBody", "Body", names(data1))
names(data1) <- gsub("mean", "Mean", names(data1))
names(data1) <- gsub("std", "StandardDeviation", names(data1))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data2<-aggregate(. ~subject + act, data1, mean)
data2<-data2[order(data2$subject,data2$act),]
write.table(data2, file = "outputTidyData.txt",row.name=FALSE)
