# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

In this project data was collected using the accelerometer and gyroscope of the Samsung Galaxy S smartphone. It was consequently downloaded, cleaned and outputted in a tidy data format that can be used for analysis.

-----
Data Set Information:
(Directly from source website at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

-----

The run_analysis.R file contains the R code that transforms the raw data into the tidy output file.
The outputTidyData.txt file is the output from the R code with all transformations completed to make it in the required tidy format.
The CodeBook.MD is a file contains information about the input data, the output data, and all transformations that occurs in the run_analysis.R program.

The run_analysis.R file, when executed in R, will pull the source data, unzip, transform, then output the tidy data set. This was written 2021/02/22 on a machine with the operating system Windows 10 x64 Home Version(10.0.18363) using R version 3.6.3 and packages data.table (1.12.8) and dplyr (0.8.5).


