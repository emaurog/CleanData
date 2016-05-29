# CleanData

Script and Results for the "Getting and Cleaning Data" course project. Contains a R script called run_analysis.R, a cookbook describing variables and the resulting data set called mean.rds

The script does the following:
  -Downloads & Unzips the data if not already present
  -Reads the test & training data
  -Reads the descriptive files (features,activities,subjects) for both sets
  -Keeps only features of interest (mean & std features) from both train & test datasets
  -Adds information about activities & subsets to both train & test datasets
  -Merges the two datasets
  -Replaces the acivity numbers with descriptions
  -creates a new dataset containing the mean of each variable for a set of Subject&Activity pair
  -Prints this data set to a file called mean.rds
  
  
