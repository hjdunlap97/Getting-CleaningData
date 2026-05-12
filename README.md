# Getting-CleaningDataProject
Human Activity Recognition tidy data analysis collected from embedded phone inertial sensors

# Files Included
* `run_analysis.R` — is the R script which executes data cleaning and organization
* `cleaned_data.txt` — output merged dataset from the mean measurements and standard deviation measurements
* `tidy_data.txt` — output tidy dataset with averages for each subject and activity
* `README.md` — describes the project
* `CodeBook.Rmd` — describes variables, data, and transformations

# Data Source
The Human Activity Recognition Using Smartphones Dataset from the UCI Machine Learning Repository.

# How the Script Works
Step 1: Load data and reads training and test datasets:
Feature data (X), Activity labels (y), Subject identifiers

Step 2: Combines training and test datasets using row binding. Merges subject, activity, and feature data into one dataset

Step 3: Extract Mean and Standard Deviation

Step 4: Replace headers and numeric identifiers with descriptive activity names (e.g., WALKING, SITTING)

Step 5: Further clean label variables:
Removes special characters and expands abbreviations

Step 6: Create Tidy Dataset
Groups data by subject and activity and calculates the average of each variable

Step 7: Export Data `cleaned_data.txt` and `tidy_data.txt`

# How to Run

Step 1: Download and unzip the dataset
Step 2: Set the working directory in R to the dataset folder
Step 3: Run: "run_analysis.R"
Step 4: Output files (`cleaned_data.txt` and `tidy_data.txt`) will be created in the working directory
