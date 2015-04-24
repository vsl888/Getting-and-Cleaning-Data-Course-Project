Getting and Cleaning Data Course Project


Introduction

This repo contains one script called run_analysis.R, which performs:
Downloading the Human Activity Recognition Using Smartphones Dataset
Reading the data from UCI HAR Dataset directory
Doing some transformations
Writing tidy data set to “tidydata.txt” text file in current working directory

CodeBook.md provides more details on the transformations.

How to Run the Script

If you choose to to comment out the download part of the script, you can manually download the data set from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and place it your working directory, where you place the run_analysis.R file.

Using the R console

Type setwd(‘<directory where you place the run_analysis.R file>’). 
Once you are in the directory, type source (‘run_analysis.R’)

OR you can also combine both setup and type source ('<your directory>/run_analysis.R')

Using the RStudio

Open the ‘run_analysis.R’ file in RStudio and click “Source”, the script should run

OR in RStudio console, 
Type setwd(‘<directory where you place the run_analysis.R file>’). 
Once you are in the directory, type source (‘run_analysis.R’)

OR you can also combine both setup and type source ('<your directory>/run_analysis.R')

Using the Unix or Mac Terminal

Go to your working directory where you place the script file and the UCI HAR Dataset directory.
Type Rscript run_analysis.R


Once the script is completed, a text will print on your console or terminal to notify you tidydata.txt file has been created.
