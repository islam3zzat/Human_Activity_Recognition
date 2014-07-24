Human Activity Recognition
==========================

Cleaning the Human Activity Recognition Using Smartphones Dataset


# Instructions

1. download [the zip file of the dataset from here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. extract the zip file optaned from ste number 1
3. lunch Rstudio and set the working directory to the UCI HAR Dataset folder ```setwd('path/to/UCI HAR Dataset')``` <br/>* If you run ```dir()``` you sould see the folders *train* and *test* and three other files
4. download the ```run_analysis.R``` script to that directory
5. run the script by executing this command ```source('run_analysis.R')```
6. now you should have a new folder caller ```analyse_results``` contaning ```dataset.txt``` and ```tidy_dataset.txt```


For each record it is provided the average of
=============================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



Notes About the units
=====================
- The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.

- The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ 
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

###The set of variables that were estimated from these signals are

mean(): Mean value
std(): Standard deviation

[for information about what the analysis files follow the link](https://github.com/islam3zzat/Human_Activity_Recognition/blob/master/CodeBook.md)

