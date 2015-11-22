# Genoa_HAR
Data Cleaning for the Human Activity Recognition Project at Universitá Degli Studi di Genoa

The original data consists of 10299 measurements of 561 variables,
wich correspond to accelerometer and gyroscope registries of 30 volunteers
performing 6 different activities.

After cleaning this initial data, a tidy data set ("tidy_data_set.txt")
is delivered.

## The tidy data set
The tidy data set contains only mean and standard deviation measurements,
wich are averaged for every volunteer and activity.

## The R script
The repository contains an R script (`run_analysis.R`). Use the script
following these instructions:

1. Download the `run_analysis.R` to the data directory
2. Start R
3. If not installed, install de data.table package with `install.packages("data.table")`
4. Go to the directory where the data is located with the `setwd()` command
5. Execute (In R), `source("run_analysis.R")`
6. Execute `run_analysis()`

What the script should do is to take the original data and process it to obtain
the tidy data set described above.