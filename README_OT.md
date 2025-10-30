## Project: Getting and Cleaning Data Course

The dataset used in this project stems from the Human Activity Recognition
Using Smartphones experiment, specifically utilizing data from the accelerometers and gyroscopes on a Samsung Galaxy S phone. 
The analysis of this information is running by the R script, run_analysis.R.

---

###  **Completed by:**  
**Oscar Mauricio Trigueros Miranda**  


---

###  **Resources**

#### A. `run_analysis.R`
The script merges the training and test data into one set, then extracts only 
the measurements for the mean and standard deviation. It then labels the activities 
with descriptive names and applies appropriate variable names to the columns.
Finally, it creates a second, tidy data set containing the average of each variable 
for every activity and subject.

#### B.`CodeBook.md`
Describes the variables, the data, and all transformations or cleaning steps performed during the analysis.

#### C. `tidy_data.txt`
Contains the final tidy data set — a summary dataset with the average of each variable for each activity and each subject (180 × 68).

---




 **Instructions**

This project uses **Samsung Galaxy S sensor signals** from 30 volunteers performing 6 activities. The goal is to 
demonstrate **fundamental data cleaning** (merging, filtering for means/deviations, and summarizing) following
**tidy data principles**.


