#Coursera getting and cleaning data project
#5 step process to get to the tiday data set
   #1.Merge training and test data
   #2.Only columns with mean and std extracted
   #3.Name the acivities in the data set
   #4.label the data set with activity names
   #5.Create Tidy data set


#1.Merge the training and test data

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"dataset")
unzip("dataset")
list.files("C:/Users/saurabhs/Documents/UCI HAR Dataset") # checking data files
#read data from text files
xTrain = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/train/x_train.txt',header=FALSE)
yTrain   = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/train/y_train.txt',header=FALSE)
features = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/features.txt',header=FALSE)
activity = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/activity_labels.txt',header=FALSE)
subject = read.table('./train/subject_train.txt',header=FALSE)
#Add names of the variables in each columns of the imported dataset
colnames(xTrain)        = features[,2]
colnames(yTrain)        = "activityid"
colnames(activity)  = c('activityid','activity');
colnames(subject)  = "subjectid";
#Bind columnns to get the labels and subject names
traindata = cbind(yTrain,subject,xTrain)

#get data from test data sets just like above


# Read in the test data

xTest       = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/test/x_test.txt',header=FALSE)
yTest       = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/test/y_test.txt',header=FALSE) 
subjecttest = read.table('C:/Users/saurabhs/Documents/UCI HAR Dataset/test/subject_test.txt',header=FALSE)


# Assign column names to the test data imported above
colnames(xTest)       = features[,2]
colnames(yTest)       = "activityid"
colnames(subjecttest) = "subjectid"

# Add columns
testdata = cbind(yTest,subjecttest,xTest)

# rowbind to get final dataset
finalData = rbind(trainingdata,testdata)











 




