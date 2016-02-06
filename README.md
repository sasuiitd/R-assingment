# R-assingment
There were 5 broad steps involved in this exercise

#1.Merge training and test data
#2.Only columns with mean and std extracted
#3.Name the acivities in the data set
#4.label the data set with activity names
#5.Create Tidy data set

Let me descrive each step in detail

#1.Merge training and test data

a. Download the data set from the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
b. unzip the files and read the information dcouments ( data types, variable names etc)
c. load the training data and add column names
d. load the test data and add columns names
e. merge the test and training data


#2 Only columns with mean and std extracted
a. Use grepl function to create a logical vector that marks all columns where we have std or mean observations
b. use this logical vector to subset the dataset created in above step

#3.Name the acivities in the data set
a. Name the activity ids using merge function and activity name table created in above steps
#4.label the data set with activity names- Use gsub function to clean up the columnnames ( details in the codebook)
#5 Tidydata set creation - Use aggregate function to group the data by candidate id and actvity id so that there are 6 records per
candidate as each candidate performs 6 activities. In total there are 180 records. Then export this data as a text file.



