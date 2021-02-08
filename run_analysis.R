
# Load the library to read the data
library("data.table") 
library("qdapTools")
library("writexl")   


##Train data loading (Three different categories:x, y, subject)
X_train <- read.table("./data/train/X_train.txt")               
y_train <- read.table("./data/train/y_train.txt")               
sub_train <- read.table("./data/train/subject_train.txt")   

##Test data loading (Three different categories:x, y, subject)
X_test <- read.table("./data/test/X_test.txt")              
y_test <- read.table("./data/test/y_test.txt")                 
sub_test <- read.table("./data/test/subject_test.txt")  

## Load the features file to assign the column names
features <- read.table("./data/features.txt")   

## Merge train and test data using rbind function (Task 1)
x <- rbind(X_train, X_test)
y <- rbind(y_train,y_test)
sub <- rbind(sub_train,sub_test)

alldata <- x
alldata$labels <- y
alldata$sub <- sub 

##Specify the name of the columns (Task 3)
colnames(alldata) <- features$V2   

## Find the measurement the mean and standard deviation (Task 2) 
dataselective <- alldata[,grepl("mean()|std()", names(alldata))]
dataselective <- cbind(subjects = rbind(sub_train, sub_test), labels = rbind(y_train, y_test), dataselective)
colnames(dataselective)[1]<-"subject"
colnames(dataselective)[2]<-"activity"

## reads the class labels with their activity name
activity_names <- read.table("./data/activity_labels.txt")   


dataselective[,2] <- lookup(dataselective[,2], activity_names, key.reassign = NULL,
                  missing = NA)

## writes the new data into txt format   
write.table(dataselective,"./data/tidy-data.txt", row.name=FALSE)

