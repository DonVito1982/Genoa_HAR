run_analysis <- function(){
    library(data.table)
    titles <- fread("features.txt")
    cols <- titles[grepl("mean\\(\\)", V2) | grepl("std\\(\\)", V2)]$V1
    reduced_Xtrain <- fread("train/X_train.txt")[,cols, with = FALSE]
    reduced_Xtest <- fread("test/X_test.txt")[,cols, with = FALSE]
    activities <- fread("activity_labels.txt")
    Ytrain <- fread("train/y_train.txt")
    Ytest <- fread("test/y_test.txt")
    Ytotal <- c(activities[Ytrain$V1]$V2, activities[Ytest$V1]$V2)
    columnNames <- titles[cols]$V2
    total_data <- rbind(reduced_Xtrain, reduced_Xtest)
    colnames(total_data) <- columnNames
    train_subjects <- fread("train/subject_train.txt")
    test_subjects <- fread("test/subject_test.txt")
    subjects <- c(train_subjects$V1, test_subjects$V1)
    tidy_data <- sapply(split(total_data, list(subjects, Ytotal)), colMeans)
    tidy_data <- rbind(colnames(tidy_data), tidy_data)
    rownames(tidy_data)[1] <- "Subject.Activity"
    write.table(t(tidy_data), file = "tidy_data_set.txt", row.names = FALSE)
}