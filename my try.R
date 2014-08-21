#set working directory
setwd("C:/Users/stephanie song/Desktop")

#download the zip file from the website given. and rename the zip file as "data zip" and save it at my desktop.

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
zip.file<-"C:/Users/stephanie song/Desktop/data.zip"
download.file(fileUrl,destfile=zip.file, mode="wb", cacheOK=FALSE)

#now there is "data.zip" on my desktop.

#unzip the "data.zip" on desktop now.

#"UCI HAR Dataset" Directory now is unzipped from zip flie.

unzip(zip.file)

list.files("C:/Users/stephanie song/Desktop")
#1. Merges the training and the test sets to create one data set

#read data use read.table and assign their names:

features<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/features.txt", header=FALSE)

activity_labels<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/activity_labels.txt",header=FALSE)

xtrain<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/train/X_train.txt",header=FALSE)

ytrain<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/train/y_train.txt",header=FALSE)

subject_train<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/train/subject_train.txt",header=FALSE)

xtest<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/test/X_test.txt",header=FALSE)

ytest<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/test/y_test.txt",header=FALSE)

subject_test<-read.table("C:/Users/stephanie song/Desktop/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
#combine data & divide them into 3 parts:

xPart<-rbind(xtrain,xtest)

yPart<-rbind(ytrain, ytest)

sPart<-rbind(subject_train, subject_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
extract_from_features<-grep("-mean\\(\\)|-std\\(\\)", features[,2])

xPart<-xPart[,extract_from_features]

names(xPart)<-features[extract_from_features,2]

names(xPart)<-gsub("\\(|\\)","",names(xPart))

#3. Uses descriptive activity names to name the activities in the data set

#create names of subject_train & subject_test(called sPart) as "subject"
names(sPart)="subject"
      
#also create names of ytrain & ytest(called yPart) as "activity"
names(yPart)="activity"
            
activity_labels[,2]=gsub("_","",tolower(as.character(activity_labels[,2])))

yPart[,1]=activity_labels[yPart[,1],2]

cleaned_data<-cbind(xPart,sPart,yPart)

write.table(cleaned_data,"tidy_data.txt", row.name=FALSE)

#4. Appropriately labels the data set with descriptive variable names. 

Colnames=names(cleaned_data)

#clean variables by remove or replace some part.

Colnames<-gsub("-std","Std", colnames)
Colnames<-gsub("()-","",colnames)
Colnames<-gsub("-mean","Mean",colnames)
Colnames<-gsub("-","",colnames)
Colnames<-gsub("Mag","Magnitude",colnames)
Colnames<-gsub("BodyBody","Body",colnames)

names(cleaned_data)=Colnames

write.table(cleaned_data, "tidy_named_data.txt", row.name=FALSE)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

































            
            
            

            