##This is R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.


## If you choose not to download the data file, please comment out the section
## Download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destzip = paste0(getwd(),"/UCIDataset.zip")
## Check system for Mac
if (Sys.info()["sysname"]=='Darwin') {
  download.file(fileUrl, destfile=destzip, method="curl")
} else {
  download.file(fileUrl, destfile=destzip) 
}

## zip and default to directory UCI HAR Dataset
unzip(destzip)

## please change the path below to where you place the unzipped UCI HAR Dataset directory
datadir <- "./UCI HAR Dataset/"


## Load raw data from main directory
features <- read.table(paste0(datadir,"features.txt"),sep="", header=FALSE)
activitylabels <- read.table(paste0(datadir,"activity_labels.txt"),sep="",header=FALSE)

## Load raw data from test directory
subject_test <- read.table(paste0(datadir,"test/subject_test.txt"), sep="", header=FALSE)
ytest <- read.table(paste0(datadir,"test/y_test.txt"), sep="", header=FALSE)
xtest <- read.table(paste0(datadir,"test/x_test.txt"), sep="", header=FALSE)

## Load raw data from train directory
subject_train <- read.table(paste0(datadir,"train/subject_train.txt"), sep="", header=FALSE)
ytrain <- read.table(paste0(datadir,"train/y_train.txt"), sep="", header=FALSE)
xtrain <- read.table(paste0(datadir,"train/x_train.txt"), sep="", header=FALSE)

## combine the test and training data 
traindata <- cbind(subject_train,ytrain,xtrain)
testdata <- cbind(subject_test,ytest,xtest)

## 1. Merges the training and the test sets to create one data set.
## final merge on all data
data <- rbind(testdata, traindata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## filter down selected feature data
selectedcols = features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

finaldata <-subset(data,select=c(1,2,selectedcols))

## 3. Uses descriptive activity names to name the activities in the data set
## merge activity id with activity label
finaldata <- merge(finaldata,activitylabels,by.x="V1.1", by.y="V1")

## reorder the columns and remove Activity id column
finaldata <- finaldata[, c(2,69,3:68)]

## 4. Appropriately labels the data set with descriptive variable names.
names(finaldata) <- c("subject", "activity", as.character(selectedcols))
names(finaldata) <- gsub("-mean\\(\\)", "mean", names(finaldata))
names(finaldata) <- gsub("-std\\(\\)", "std", names(finaldata))
names(finaldata) <- gsub("^t", "time", names(finaldata))
names(finaldata) <- gsub("^f", "frequency", names(finaldata))
names(finaldata) <- gsub("-", "", names(finaldata))
names(finaldata) <- gsub("BodyBody", "body", names(finaldata))
names(finaldata) <- tolower(names(finaldata))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
library(plyr);
tidydata <- aggregate(. ~subject + activity, finaldata, mean)
tidydata <- tidydata[order(tidydata$subject,tidydata$activity),]

write.table(tidydata, file = "tidydata.txt",row.name=FALSE)

print (paste0(getwd(), "/tidydata", " created."))
