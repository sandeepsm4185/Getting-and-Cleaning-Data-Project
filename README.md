# Getting-and-Cleaning-Data-Project
This repo contains the below files:
1. summary.txt - this is the tidy data set generated for the project
2. run_analysis.R - this is the R script used to generate the above tidy data set
3. CodeBook.md - this contains details regarding the variables in the tidy data set

Source of data:
Sensor signals (accelerometer and gyroscope) from 30 volunteers for a set of activities. For details, see below:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Steps performed as part of the Project:
1. Source data had broken down the data from 30 subjects to two sets - train and test. These were joined back to form a tidy data set.
2. Activities and sensor signals were represented in codes, these were changed to descriptive labels (for details, see codebook)
3. Sensor output columns other than those representing mean or standard deviation were removed.
4. Summary table (summary.txt) was created with mean of each of the above variables (mean and standard deviation) for each subject and activity.
