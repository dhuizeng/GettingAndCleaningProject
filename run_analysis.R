## This library is required for arrange()

library(dplyr)

## Get Test data, activity labels, subject labels, and column names. Make sure you are
## in a directory directly above the "UCR HAR Dataset" folder.

testdata <- read.table("UCI HAR Dataset/test/X_test.txt",sep="",header = FALSE)
testsublabels <- scan("UCI HAR Dataset/test/subject_test.txt")
testactlabels <- scan("UCI HAR Dataset/test/y_test.txt")

traindata <- read.table("UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)
trainsublabels <- scan("UCI HAR Dataset/train/subject_train.txt")
trainactlabels <- scan("UCI HAR Dataset/train/y_train.txt")

features <- readLines("UCI HAR Dataset/features.txt")

## This gets all of the column numbers and names which include "mean()" or "std()" in their names.

colnums <- which(grepl("mean\\(\\)|std\\(\\)", features))
secondelement <- function(x){x[2]}
colname <- tolower(c("Activity","Subject ID",sapply(strsplit(features[colnums]," "),secondelement)))

## Here we get the subject labels for the training and test data sets. These are looped over
## in the folliwing bit of code.

testsubs <- as.numeric(levels(factor(testsublabels)))
trainsubs <- as.numeric(levels(factor(trainsublabels)))

## Here we first create an empty data frame and then fill it with the two sets of nested
## loops below. The first nested loop runs over the subjects in the test set and subsets
## out the appropriate rows and columns that correspond to a given activity. The means of
## each column are then taken and row-bound to the data frame. The task is then repeated
## for the training data set.

DF <- data.frame()
for(subjid in testsubs){
        for(actid in 1:6){
                sub <- which(testsublabels == subjid & testactlabels == actid)
                data <-c(actid, subjid, colMeans(testdata[sub,colnums]))
                DF <- rbind(DF,data)
        }
}

for(subjid in trainsubs){
        for(actid in 1:6){
                sub <- which(trainsublabels == subjid & trainactlabels == actid)
                data <-c(actid, subjid, colMeans(traindata[sub,colnums]))
                DF <- rbind(DF,data)
        }
}

## The data frame DF now contains 68 variables and 180 observations (30 subjects * 6 activities)
## but it needs to be made a litte nicer. First it is arranged by subject id (unnamed as X2 right now).
## The data frame is then passed the names of each column and given labels to the activity factors.

DF <- arrange(DF,X2)
colnames(DF) <- colname
DF$activity <-factor(DF$activity,levels = 1:6,labels = c("walking","walking up stairs",
                                                        "walking down stairs",
                                                        "sitting", "standing", "laying"))

## Finally, write the data out to "Tidydata.txt".

write.table(DF,"Tidydata.txt",row.name =FALSE)

