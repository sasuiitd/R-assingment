#Coursera getting and cleaning data project
#5 step process to get to the tiday data set
#1.Merge training and test data
#2.Only columns with mean and std extracted
#3.Name the acivities in the data set
#4.label the data set with activity names
#5.Create Tidy data set


#1.Merge the training and test data

#downloading the dataset into my local machine
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(url,"dataset");
unzip("dataset");
list.files("C:/Users/saurabhs/Documents/UCI HAR Dataset"); # checking data files
setwd("~/UCI HAR Dataset"); # set working directory
#read data from text files
xTrain = read.table('train/x_train.txt',header=FALSE); # get all the observations from training data set
yTrain   = read.table('train/y_train.txt',header=FALSE); # get all activity numbers from the training data set
varnames = read.table('features.txt',header=FALSE); # get all the column names
activity = read.table('activity_labels.txt',header=FALSE); # name of the activity
candidate = read.table('train/subject_train.txt',header=FALSE); # subject on whom the experiment was done

#Add names of the variables in each columns of the imported dataset
colnames(xTrain)        = varnames[,2];
colnames(yTrain)        = "activitynumber";
colnames(activity)  = c('activitynumber','activityname');
colnames(candidate)  = "candidateid";

#Bind columnns to get the labels and subject names
traindata = cbind(yTrain,candidate,xTrain);

#get data from test data sets just like above
# Read in the test data

xTest       = read.table('test/x_test.txt',header=FALSE);
yTest       = read.table('test/y_test.txt',header=FALSE); 
candidatetest = read.table('test/subject_test.txt',header=FALSE);


# Assign column names to the test data imported above
colnames(xTest)       = varnames[,2];
colnames(yTest)       = "activitynumber";
colnames(candidatetest) = "candidateid";

# Add columns
testdata = cbind(yTest,candidatetest,xTest);

# rowbind to get final dataset
df = rbind(traindata,testdata); #final data set for further processing

# selecting the right variables/column names
columnname<-colnames(df);
#Inorder to subset the final table df to pick up the right variables we create a logical vector for subsetting
RightVar<- (grepl("activity..",columnname) | grepl("subject..",columnname)
            | grepl("-mean..",columnname) & !grepl("-meanFreq..",columnname) & !grepl("mean..-",columnname) |
              grepl("-std..",columnname) & !grepl("-std()..-",columnname));
#subset the df data using the logical vector Rightvar

df1<-df[RightVar==TRUE];

#Now get the activity descrption against activity number

df2<-merge(df1,activity, by='activitynumber', all.x=TRUE);

#cleaning up the variable names
for (i in 1:length(df2columnnames)) 
  + {
    +     
      +     df2columnnames[i] = gsub("-std","StdDev",df2columnnames[i])
      +     df2columnnames[i] = gsub("-mean","Mean",df2columnnames[i])
      +     df2columnnames[i] = gsub("^(t)","Time",df2columnnames[i])
      +     df2columnnames[i] = gsub("^(f)","Freq",df2columnnames[i])
      +     df2columnnames[i] = gsub("BodyBody","Body",df2columnnames[i])
      +     df2columnnames[i] = gsub("Mag","Magnitude",df2columnnames[i])
      +     df2columnnames[i] = gsub("\\()","",df2columnnames[i])
      + };

colnames(df2)<-df2columnnames; # updating the variablenames to be exported into the tiday dataset
View(df2);
df3<-df2[,names(df2)!='activityname'];
finaldf<-aggregate(df3,by=list(df3$activitynumber,df3$candidateid),FUN=mean);
finaldf1<-finaldf[,3:22];
Finaldata<-merge(finaldf1,activity,by='activitynumber', all.x=TRUE);
write.table(Finaldata, 'tidydata.txt',row.names=FALSE);





