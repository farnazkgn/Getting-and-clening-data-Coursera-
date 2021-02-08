# Getting-and-clening-data-Coursera-
Final project for Coursera: Getting and Cleaning Data (Course)

DataSets:

The ultimate goal of the script is to read and merge multiple datasets (train, test, features, subjects, etc.) to one tidy dataset. 
There are 7 files/datasets to explore and process:

- Train set:
	'train/X_train.txt': Training set
	'train/y_train.txt': Training labels
- Test set:
	'test/X_test.txt': Test set
	'test/y_test.txt': Test labels
- Features:
	'features.txt': List of all features
- Activity Labels:
	'activity_labels.txt': Links the class labels with their activity name
- Subject identifiers:
	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
	'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The script first merge the train and test sets (x and y) and use features file to assign a proper name to each column.

For task 2 ("Extracts only the measurements on the mean and standard deviation for each measurement"), we use "grepl" to extract the columns with mean and standard deviation.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.
