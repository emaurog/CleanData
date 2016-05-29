# CleanData

Script and Results for the "Getting and Cleaning Data" course project. Contains a R script called run_analysis.R, a cookbook describing variables and the resulting data set called mean.rds

The script does the following:\n

  -Downloads & Unzips the data if not already present\n
  -Reads the test & training data\n
  -Reads the descriptive files (features,activities,subjects) for both sets\n
  -Keeps only features of interest (mean & std features) from both train & test datasets\n
  -Adds information about activities & subsets to both train & test datasets\n
  -Merges the two datasets\n
  -Replaces the acivity numbers with descriptions\n
  -creates a new dataset containing the mean of each variable for a set of Subject&Activity pair\n
  -Prints this data set to a file called mean.rds\n
  
  
  
  
