# getdata-007

This repository was created for the getdata-007 course project.

## Contents
There are three files in this repository:

1. This ReadMe.md
2. run_analysis.R - A script used to generate a tidy dataset containing the average mean and standard deviation values across a series of measurements by subject and activity based on data from a phone's accelerometer and gyroscope.
3. summarized_data.txt - The file containing tidy data from running the run_analysis.R script.

## Usage

1. Sync the run_analysis.R file to your working directory.
2. Download the data from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
3. Unzip this file in your working directory. You should end up with a folder called "UCI HAR Dataset" in your working directory.
4. Install the data.table package if it is not already installed.
5. Run the script.

## Output

This script will:

1. Read and combine the data for both the training and test datasets
2. Extract the mean and standard deviation measurements
3. Add descriptive labels for the activities and measurements
4. Take the average of each measurement, grouped by Activty and Subject
5. Write the data to the file summarized_data.txt in your working directory.

You can read this data back into R as follows:
`summarized_data <- read.table("summarized_data.txt", header=TRUE)`
