

## Set location of file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download file if it is not yet downloaded
if (!file.exists("zipFile.zip")) {

        ## Set this value to true so download is possible on windows machine
        setInternet2(TRUE)

        ## Download the file
        download.file(fileurl, "zipFile.zip")
}

## Unzip zip file if it is not yet unzipped
if (!file.exists("UCI HAR Dataset")) unzip("zipFile.zip")

## Get feature names
featureNames <- readLines("./UCI HAR Dataset/features.txt")

## Read in table with activity labels and names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
        colClasses = "character", col.names = c("ActivityLabel", "ActivityName") )

## Read in subject data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "SubjectID")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "SubjectID")

## Read in activity label data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = "character",
        col.names = "ActivityLabel")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = "character",
        col.names = "ActivityLabel")

## Read in sensor data
## In below read.table calls, use check.names = FALSE to prevent special characters 
## (spaces, parentheses) from being replaced with periods
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric",
        col.names = featureNames, check.names = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric",
        col.names = featureNames, check.names = FALSE)

## Create 'Train' and 'Test' vectors to denote where each row comes from in merged dataframe
setType_test <- as.data.frame((rep("TEST", nrow(subject_test))))
setType_train <- as.data.frame((rep("TRAIN", nrow(subject_train))))
names(setType_test) <- "DataSetType"
names(setType_train) <- "DataSetType"

## Create test data frame by column binding test subject, y, set type, and X data
testData <- cbind(subject_test, y_test, setType_test, X_test)

## Create train data frame using same method as test data
trainData <- cbind(subject_train, y_train, setType_train, X_train)

## Merge test and train sets by rbinding the dataframes
data <- rbind(trainData, testData)

## Merge the data frame with the activity names to get descriptive activity names
data <- merge(activity_labels, data)

## Remove everything from the workspace except the merged dataframe
rm(list = setdiff(ls(), "data"))

## Remove all 'X' columns except those containing std or mean
## (Keep only the first 4 columns and column names containing 'std()' or 'mean()' )
data <- data[, c(1:4, grep("mean\\(\\)|std\\(\\)", names(data)))]

## Load plyr library and use ddply to get the mean of each numeric column 
## for each combination of subjectID and ActivityName using numcolwise(mean)
library(plyr)
table <- ddply(data, .(SubjectID, ActivityName), numcolwise(mean))

## Rename averaged columns (all but columns 1 and 2) to indicate they are average values
names(table) <- c(names(table)[1:2], paste(names(table)[c(-1,-2)], "Average"))