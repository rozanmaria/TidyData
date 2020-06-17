---
title: "CODEBOOK"
author: "Rozan"
date: "6/17/2020"
output:
  html_document: default
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Summary of the data

The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

Here are the data for the project:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

# Variables

1. X_train,Y_train, X_test, Y_test, Sub_train and Sub_test contain data from the downloaded files.
2. X_tot, Y_tot and Sub_tot merge the data and final_tabe merges all the data together.
3. variable_name contain the features which are the column names for the X_tot and activity_label contains the names of the activities performed. 
4. In the final_table the columns activity_label is a factor, Subject is integer and all the others are numeric.

# R Script

The R Script does the following,

1. Merges the training and the test sets to create one data set - Training and test sets were all combined first and then X, Y and subject data were all merged together.
2. Extracts only the measurements on the mean and standard deviation for each measurement - choosing variable names with mean and standard deviation and subsetting those from the table. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject - tot_mean is a second data set is a tidy data set with the means of each variable as described above. It is then exported into a text file. 

