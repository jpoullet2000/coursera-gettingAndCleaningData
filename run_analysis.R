library(dplyr)
library(tidyr)

samsungdataFile = file.path(getwd(),"samsungdata.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",method='curl', destfile = samsungdataFile)
unzip(samsungdataFile)

#' Lines in vectors (separator = blank)
#'
#' For each line, it removes the first blank space and consider the other as separator.
#' It can deal with different space sizes (ex:   a b    c\n  d     e  f). 
#' @param lines character list (obtained with readLines(), see \code{\link{readLines}})
#' @return a data.frame (blank spaces have been used as separator whatever the number of spaces)
empty_spaces_lines_to_df <- function(lines){
    l <- lapply(lines, function(x){
        x <- sub("^\\s+", "", x)
        strsplit(x, split = " +")[[1]]
    })
    df <- do.call("rbind",l)
}

## reading training data file 
X_train_file <- file.path(getwd(),'UCI HAR Dataset/train/X_train.txt')
X_train_lines <- readLines(X_train_file)
X_train <- empty_spaces_lines_to_df(X_train_lines)
str(X_train)
rm(list=c("X_train_lines"))

## reading test data file 
X_test_file <- file.path(getwd(),'UCI HAR Dataset/test/X_test.txt')
X_test_lines <- readLines(X_test_file)
X_test <- empty_spaces_lines_to_df(X_test_lines)
#X_test <- do.call("rbind",X_test_list)
str(X_test)
rm(list=c("X_test_lines"))

## reading feature variables
featureFile <- file.path(getwd(),'UCI HAR Dataset/features.txt')
feature_lines <- readLines(featureFile)
feature_df <- empty_spaces_lines_to_df(feature_lines)
rm(list=c("feature_lines"))

## merging train and test sets
mdf <- as.data.frame(rbind(X_train,X_test))
mdf <- sapply(mdf, function(x) as.numeric(as.character(x)))
mdf <- as.data.frame(mdf)
colnames(mdf) <- feature_df[,2]
mdfF <- tbl_df(mdf)
colnames(mdfF) <- make.names(colnames(mdfF), unique=TRUE) # make column names unique
mdfF.MeanStd <- select(mdfF,matches('[Mm]ean|[Ss]td'))
mdfF.MeanStd <- mutate(mdfF.MeanStd, traintest = c(rep("train",nrow(X_train)),rep("test",nrow(X_test))))
mdfF.MeanStd

## reading activity labels
activity_label_file <- file.path(getwd(),'UCI HAR Dataset/activity_labels.txt')
activity_label_lines <- readLines(activity_label_file)
activity_label <- empty_spaces_lines_to_df(activity_label_lines)
str(activity_label)
rm(list=c("activity_label_lines"))

## add activity labels
y_train_file <- file.path(getwd(),'UCI HAR Dataset/train/y_train.txt')
y_train <- read.csv(y_train_file, header=FALSE)
y_train_labels <- apply(y_train, 1, function(x) activity_label[which(activity_label[,1]==x),2])
y_test_file <- file.path(getwd(),'UCI HAR Dataset/test/y_test.txt')
y_test <- read.csv(y_test_file, header=FALSE)
y_test_labels <- apply(y_test, 1, function(x) activity_label[which(activity_label[,1]==x),2])
mdfF.MeanStd <- mutate(mdfF.MeanStd, activity_labels = c(y_train_labels, y_test_labels))

## add the subject info 
subject_train_file <- file.path(getwd(),'UCI HAR Dataset/train/subject_train.txt')
subject_train <- read.csv(subject_train_file, header = FALSE)
subject_test_file <- file.path(getwd(),'UCI HAR Dataset/test/subject_test.txt')
subject_test <- read.csv(subject_test_file, header = FALSE)
mdfF.MeanStd <- mutate(mdfF.MeanStd, subject = c(subject_train[,1], subject_test[,1]))
str(mdfF.MeanStd)

## create the tidy data set with the average of each variable for each activity and each subject
df.av <- mdfF.MeanStd %>%
    select(-traintest)  %>%
    group_by(subject, activity_labels) %>%
    summarise_each(funs(mean))
tidy.df <- df.av %>% gather(feature,acceleration,-subject,-activity_labels)

## save tidy data set
write.table(tidy.df,file = file.path(getwd(),"tidy_data_set.csv"),row.names = FALSE)
write.table(levels(tidy.df$feature), file = file.path(getwd(),"feature_list.csv"),row.names=FALSE,col.names = FALSE)

















