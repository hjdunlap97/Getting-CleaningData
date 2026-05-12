library(dplyr)

# Set working directory
# setwd()

# Read metadata from text files
features <- read.table("features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

# Load training data
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Load test data
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Merge test and training datasets together
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Name columns
colnames(X) <- features$V2
colnames(y) <- "activity"
colnames(subject) <- "subject"

# Combine all data
data <- cbind(subject, y, X)

# Extract mean and std only
mean_std_data <- data %>%
  select(subject, activity, contains("mean()"), contains("std()"))

# Use descriptive activity names
mean_std_data$activity <- factor(mean_std_data$activity,
                                 levels = activity_labels$V1,
                                 labels = activity_labels$V2)
# Clean variable names
clean_names <- colnames(mean_std_data)

clean_names <- gsub("\\(\\)", "", clean_names)
clean_names <- gsub("-", "_", clean_names)
clean_names <- gsub("^t", "Time_", clean_names)
clean_names <- gsub("^f", "Frequency_", clean_names)
clean_names <- gsub("Acc", "Acceleration", clean_names)
clean_names <- gsub("Gyro", "Gyroscope", clean_names)
clean_names <- gsub("Mag", "Magnitude", clean_names)
clean_names <- gsub("BodyBody", "Body", clean_names)

colnames(mean_std_data) <- clean_names

# Create tidy dataset (avg. per subject & activity)
tidy_data <- mean_std_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

head(tidy_data)

# Write output files
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
