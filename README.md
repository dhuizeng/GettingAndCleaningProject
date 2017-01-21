# Getting and Cleaning Data Project

This R code takes the training and test data sets from the UCI Machine Learning Repository and
merges them into a single data set, retaining only the average values of the mean and standard deviation
of the measured quantities for set of test subjects and activities.

## Generating the Tidy data set

To generate the file "Tidydata.txt", first place the file "run_analysis.R" into a directory above the "UCI HAR Dataset" folder. Make sure you have the package "dplyr" installed, as the script utilizes this package. Run the Rscript "run_analysis.R", and you should find the tidy data set!

## Loading the data set

To load the data set into R, simply place "Tidydata.txt" into your working directory and run the command "load.table("Tidydata.txt")". 

