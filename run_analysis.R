#To create data directory if it does not exist
if (!file.exists("./data")){
        dir.create("./data")
}


#Download the file and place it in the data directory
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/Dataset.zip")

#Unzip the file 
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

filepath <- file.path("./data", "UCI HAR Dataset")


#Read the data

#Read Activity files
activityTest <- read.table (file.path(filepath, "test","Y_test.txt"))
activityTrain <- read.table (file.path(filepath, "train","Y_train.txt"))

#Read the Subject files
subjectTest <- read.table (file.path(filepath, "test","subject_test.txt"))
subjectTrain <- read.table (file.path(filepath, "train","subject_train.txt"))

#Read the Features files
featuresTest <- read.table (file.path(filepath, "test","x_test.txt"))
featuresTrain <- read.table (file.path(filepath, "train","x_train.txt"))


##1. MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET

#combine by row
activity <- rbind(activityTrain, activityTest)
subject <- rbind (subjectTrain, subjectTest)
features <- rbind(featuresTrain, FeaturesTest)

#variable names
colnames(activity) <- c("Activity")
colnames(subject) <- c("Subject")
nameFeatures <- read.table(file.path(filepath, "features.txt"))
colnames(features) <- nameFeatures$V2

#Merged data
#combine by column
data <- cbind (features,subject, activity)

##2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD
##      DEVIATION FOR EACH MEASUREMENT   

#Select the columns which has the mean and standard deviation
subNames <- nameFeatures$V2[grep("mean\\(\\)|std\\(\\)", nameFeatures$V2)]
selectedcolnames <- c(as.character(subNames), "Subject", "Activity")

#Subsets data with only measurements on mean and standard deviation
subData_mean_std <- subset(data, select = selectedcolnames)

##3. USERS DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN DATA SET

#reads the activity labels
activityLabels <- read.table (file.path(filepath, "activity_labels.txt"))

# Factorizes the the variable "Activity" in the data frame using the "activityLabels"
data$Activity <- factor(data$Activity, levels = activityLabels$V1, labels = activityLabels$V2)
subData_mean_std$Activity <- factor(data$Activity, levels = activityLabels$V1, labels = activityLabels$V2)

#4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
#Removes parentheses
colnames(data) <- gsub('\\(|\\)',"",names(data))

# Make syntactically valid names
colnames(data) <- make.names(colnames(data))

#Make clearer names
colnames(data) <- gsub('Acc',"Acceleration",colnames(data))
colnames(data) <- gsub('GyroJerk',"AngularAcceleration",colnames(data))
colnames(data) <- gsub('Gyro',"AngularSpeed",colnames(data))
colnames(data) <- gsub('Mag',"Magnitude",colnames(data))
colnames(data) <- gsub('^t',"TimeDomain.",colnames(data))
colnames(data) <- gsub('^f',"FrequencyDomain.",colnames(data))
colnames(data) <- gsub('\\.mean',".Mean",colnames(data))
colnames(data) <- gsub('\\.std',".StandardDeviation",colnames(data))
colnames(data) <- gsub('Freq\\.',"Frequency.",colnames(data))
colnames(data) <- gsub('Freq$',"Frequency",colnames(data))

# correct typo
colnames(data) <- gsub("BodyBody", "Body", colnames(data))

##5. CREATES A SECOND, INDEPENDENTLY TIDY DATA SET WITH THE AVERAGE
##      OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

library(dplyr)

data2 <- aggregate(.~ Subject + Activity, data, mean)
data2 <- data2[order(data2$Subject,data2$Activity),]
write.table(data2, file= "tidyData.txt", row.name= FALSE)










