library(dplyr)
## Get Test data, activity labels and subject labels

# testdata <- read.table("UCI HAR Dataset/test/X_test.txt",sep="",header = FALSE)
# testsublabels <- scan("UCI HAR Dataset/test/subject_test.txt")
# testactlabels <- scan("UCI HAR Dataset/test/y_test.txt")
# 
# traindata <- read.table("UCI HAR Dataset/train/X_train.txt",sep="",header = FALSE)
# trainsublabels <- scan("UCI HAR Dataset/train/subject_train.txt")
# trainactlabels <- scan("UCI HAR Dataset/train/y_train.txt")
# 
# features <- readLines("UCI HAR Dataset/features.txt")
colnums <- which(grepl("mean\\(\\)|std\\(\\)", features))

secondelement <- function(x){x[2]}
colname <- tolower(c("Activity","Subject ID",sapply(strsplit(features[colnums]," "),secondelement)))



testsubs <- as.numeric(levels(factor(testsublabels)))
trainsubs <- as.numeric(levels(factor(trainsublabels)))


DF <- data.frame()
for(subjid in testsubs){
        for(actid in 1:6){
                sub2 <- which(testsublabels == subjid & testactlabels == actid)
                data2 <-c(actid, subjid, colMeans(testdata[sub2,colnums]))
                DF <- rbind(DF,data2)
        }
}

for(subjid in trainsubs){
        for(actid in 1:6){
                sub <- which(trainsublabels == subjid & trainactlabels == actid)
                data <-c(actid, subjid, colMeans(traindata[sub,colnums]))
                DF <- rbind(DF,data)
        }
}


DF <- arrange(DF,X2)
colnames(DF) <- colname
DF$activity <-factor(DF$activity,levels = 1:6,labels = c("walking","walking up stairs",
                                                        "walking down stairs",
                                                        "sitting", "standing", "laying"))
write.table(DF,"Tidydata.txt",row.name =FALSE)

