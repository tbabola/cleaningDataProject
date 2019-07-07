library(dplyr)
# Load data ---------------------------------------------------------------

workingdir <- 'C:/Users/Travis/Documents/Programming Courses/Data Science Course/DataCleaning/Project/'
setwd(workingdir)


data <- rbind(read.table('./UCI HAR Dataset/test/X_test.txt'),
          read.table('./UCI HAR Dataset/train/X_train.txt'))


feature_labels <- read.table('./UCI HAR Dataset/features.txt')
colToKeep <- grep('*mean\\(|*std\\(',feature_labels$V2)
labels <- feature_labels$V2[colToKeep]
labels <- gsub('-','',labels)
labels <- gsub('\\(\\)','',labels)
data <- data[,colToKeep]
colnames(data) <- labels

# load Y data and attach to data ------------------------------------------------------

data_y <- rbind(read.table('./UCI HAR Dataset/test/y_test.txt'),
            read.table('./UCI HAR Dataset/train/y_train.txt'))
activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
activity_labels$V2 <- unlist(lapply(activity_labels$V2,tolower))
data_y2 <- inner_join(data_y,activity_labels)
data$activity <- data_y2$V2

# load subject data and merge ---------------------------------------------

data_subjects <- rbind(read.table('./UCI HAR Dataset/test/subject_test.txt'),
                          read.table('./UCI HAR Dataset/train/subject_train.txt'))
data$subjectID <- data_subjects$V1


# create tidy table 2 with means per activity per subject -----------------
data2 <- aggregate(.~subjectID+activity,data,FUN="mean")
data2 <- data2[order(data2$subjectID),]



