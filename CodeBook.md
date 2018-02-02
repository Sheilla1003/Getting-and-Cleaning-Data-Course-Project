# CODE BOOK

## Overview of the Raw Data

**Raw Data**:Human Activity Recognition using smartphones dataset 
Link:(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

**Source of the Data**: UCI Machine Learning Repository
Link: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

This dataset is from the 30 recordings of 30 subject/volunteers with an age bracket of 19-48 years performing six (6) activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors. A 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz are captured using an embedded accelerometer and gyroscope. The experiments have been video-recorded to label data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For the detailed methodology of this experiment, refer to README.txt in the project folder.

The following table relates the 17 signals to the names used as prefix for the variables names present in the dataset. "XYZ"denotes three variables, one for each axis:

**Name**                           |**Time Domain**                            |**Frequency Domain**
-----------------------------------|-------------------------------------------|--------------------------------------------
Body Acceleration                  |TimeDomain.BodyAcceleration.XYZ            |FrequencyDomain.BodyAcceleration.XYZ
Gravity Acceleration               |TimeDomain.GravityAcceleration.XYZ         |
Body Acceleration Jerk             |TimeDomain.BodyAccelerationJerk.XYZ        |FrequencyDomain.BodyAccelerationJerk.XYZ
Body Angular Speed                 |TimeDomain.BodyAngularSpeed.XYZ            |FrequencyDomain.BodyAngularSpeed.XYZ
Body Angular Acceleration          |TimeDomain.BodyAngularAcceleration.XYZ     |
Body Acceleration Magnitude        |TimeDomain.BodyAccelerationMagnitude       |FrequencyDomain.BodyAccelerationMagnitude
Gravity Acceleration Magnitude     |TimeDomain.GravityAccelerationMagnitude    |
Body Acceleration Jerk Magnitude   |TimeDomain.BodyAccelerationJerkMagnitude   |FrequencyDomain.BodyAccelerationJerkMagnitude
Body Angular Speed Magnitude       |TimeDomain.BodyAngularSpeedMagnitude       |FrequencyDomain.BodyAngularSpeedMagnitude
Body Angular Acceleration Magnitude|TimeDomain.BodyAngularAccelerationMagnitude|FrequencyDomain.BodyAngularAccelerationMagnitude

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values.
* iqr(): Interquartile range
* entropy(): Signal entropy
* arCoeff(): Autoregression coefficients with Burg order equal to 4
* correlation(): Correlation coefficient between two signals
* maxInds(): Index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): Skewness of the frequency domain signal
* kurtosis(): Kurtosis of the frequency domain signal
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between some vectors.

No unit of measures is reported as all features were normalized and bounded within [-1,1].

## Data Transformation

The table below shows the files used in run_analysis.R script.

**Files**          |**Description**                                   |**Number of Observations**|**Number of Variables**
------------------ |:-------------------------------------------------|:------------------------:|:----------------------:
Y_train.txt        |Training labels                                   |7352                      |1
Y_test.txt         |Test lables                                       |2947                      |1
subject_train.txt  |Subject ID. Its range is from 1 to 30             |7352                      |1
subject_test.txt   |Subject ID. Its range is from 1 to 30             |2947                      |1
x_train.txt        |Training set                                      |7352                      |561
x_test.txt         |Test set                                          |2947                      |561
features.txt       |List of all features                              |561                       |2
activity_labels.txt|Links the training labels with their activity name|6                         |2

The raw dataset is processed with run_analysis.R script to create a tidy dataset.

**1. Merge the training and test sets**

There are three (3) descriptive variable names used in the data frame, namely: **features** (x_train.txt, x_test.txt), **subject** (subject_train.txt, subject_test.txt) and **activity** (y_train.txt, y_test.txt). These are merged to obtain a single dataset. Variables are labelled with the names assigned by original collectors (features.txt). The assigned variable for the merged data is **_"data"_**. 


**2. Extract the mean and standard deviation measurements**

A subset of the merged dataset is performed to extract only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std"). The subset data is stored in **_"subData_mean_std"_** variable.

**3. Use descriptive activity names to name the acitivites**

A descriptive activity names from "activity_labels.txt" is used to label the activity variable. So instead of integers from 1 to 6, it is replaced with its corresponding activity names.

- 1 - WALKING

- 2 - WALKING_UPSTAIRS

- 3 - WALKING_DOWNSTAIRS

- 4 - SITTING

- 5 - STANDING

- 6 - LAYING


**4. Appropriately labels the dataset with descriptive variable names**

Name of the features from (features.txt) is labelled using descriptive variable names.The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was expanded to TimeDomain.BodyAcceleration.Mean.X).
The following changes are made:

* Special characters (i.e. (, ), and -) are removed.
* The initial f and t are expanded to frequencyDomain and timeDomain respectively.
* Acc, GyroJerk, Gyro, Mag, std, freq, mean are replaced with Acceleration,AngularAcceleration, AngularSpeed, Magnitude, StandardDeviation,Frequency, Mean respectively.
* Replaced (supposedly incorrect as per source's features_info.txt file) BodyBody with Body.




**5. Create a second independent tidy data set with the average of each variable for each activity and each subject**

The independent tidy data with filename "tidyData.txt" is the file output of run_analysis.R script.


