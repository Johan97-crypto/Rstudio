# ---------------------------------------------------------
# Getting and Cleaning Data - Course Project 
# Author: Oscar Mauricio Trigueros Miranda
# ---------------------------------------------------------
#


# ---------------------------------------------------------
# 1) Load local processed data (
# ---------------------------------------------------------
# Define the local path to your processed dataset folder

path <- normalizePath(".omt/data_procesada")

# Verify folder structure exists
if (!dir.exists(file.path(path, "UCI HAR Dataset"))) {
  stop("Data folder not found. Please ensure 'UCI HAR Dataset' exists inside ./data_procesada/")
}




# 2) Read activity labels & features
activityLabels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"),
                        col.names = c("classLabels", "activityNames"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"),
                  col.names = c("index", "featureNames"))

# 3) Determine features (mean/std) and descriptive names via gsubfn
featuresNeeded <- grep("(mean|std)\\(\\)", features[["featureNames"]])
measurements <- features[featuresNeeded, featureNames]
measurements <- gsubfn("(^t|^f|Acc|Gyro|Mag|BodyBody|\\(\\))",
                       list("t" = "Time",
                            "f" = "Frequency",
                            "Acc" = "Accelerometer",
                            "Gyro" = "Gyroscope",
                            "Mag" = "Magnitude",
                            "BodyBody" = "Body",
                            "()" = ""),
                       measurements)

# 4) TRAIN split
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, featuresNeeded, with = FALSE]
setnames(train, colnames(train), measurements)
activityTrain <- fread(file.path(path, "UCI HAR Dataset/train/y_train.txt"), col.names = "Activity")
subjectTrain  <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"), col.names = "SubjectID")
train <- cbind(activityTrain, subjectTrain, train)

# 5) TEST split
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, featuresNeeded, with = FALSE]
setnames(test, colnames(test), measurements)
activityTest <- fread(file.path(path, "UCI HAR Dataset/test/y_test.txt"), col.names = "Activity")
subjectTest  <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"), col.names = "SubjectID")
test <- cbind(activityTest, subjectTest, test)

# 6) Merge, label activities, factor subjects
testTrain <- rbind(train, test)
testTrain[["Activity"]] <- factor(testTrain[["Activity"]],
                                  levels = activityLabels[["classLabels"]],
                                  labels = activityLabels[["activityNames"]])
testTrain[["SubjectID"]] <- as.factor(testTrain[["SubjectID"]])

# 7) Melt and cast to compute averages by SubjectID + Activity
melted <- melt.data.table(testTrain, id = c("SubjectID", "Activity"))
tidyDT <- dcast(melted, SubjectID + Activity ~ variable, mean)

# 8) Write outputs (two names for reviewer convenience)
data.table::fwrite(tidyDT, file = "tidy_data.txt")
data.table::fwrite(tidyDT, file = "tidyData.txt")
# End
