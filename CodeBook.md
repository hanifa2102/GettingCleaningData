CodeBook
=================================================
This files will describe data and all the cleansing operations performed.
* Data site
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The code run_analysits.R explains all the steps to clean the data.
1. The test and training data are appended across three different data segments
	1. testData and trainData        --> appendedData
	2. trainLabel and testLabel      --> appendedLabel
	3. trainSubject and testSubject  --> appendedSubject
2. Retrieve the features data set and just extract those features which are mean or standard deviations.
3. Transform the activity digit by merging withe activity_labels dataset.
4. Merge all the Subject/Label/Data into one final merged.data
