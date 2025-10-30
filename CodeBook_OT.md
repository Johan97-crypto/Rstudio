


## ** CODE BOOK**


---

**A. Source and Preparation**  
- The raw data used for this project come from the [Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  
- After downloading, extract the file **`getdata_projectfiles_UCI HAR Dataset.zip`** into your preferred R working directory.

**B. Executing the Script**  
- This script performs all the necessary cleaning and transformation steps and produces the file **`tidy_data.txt`**, which contains the summarized version of the dataset.


**C. Processing (R Script Overview)**

The **`run_analysis.R`** script executes the complete data preparation pipeline in five key stages, as outlined in the Coursera project instructions:

#### **Step 1 – Melting data**  
- Reads the separate training and testing data files (measurements, labels, and subjects).  
- Assigns appropriate column names and merges both sets into one unified dataset.

#### **Step 2 – Selecting Mean and Standard Deviation Variables**  
- Filters the dataset to keep only measurements related to **mean** and **standard deviation**.

#### **Step 3 – Applying Descriptive Activity Labels**  
- Replaces numeric activity codes with readable names such as *WALKING*, *LAYING*, *SITTING*, etc.
  
- Improves readability by expanding abbreviations and adjusting prefixes:
   `t: `Time_`  
   `f: `Frequency 
   `Acc: `Accelerometer`  
   `Gyro: `Gyroscope`  
   `Mag:`  `Magnitude`  
   Removes parentheses and replaces hyphens with underscores.

#### **Step 4 –  Final Tidy Dataset**  
- Calculates the **average of each measurement** for every **activity** and **subject**.  
- The resulting tidy dataset is saved as **`tidy_data.txt`**, with no row names, following Coursera’s format requirements.

---

 **D. Important Notes**

- The script expects all input files to be stored inside the same directory (`UCI HAR Dataset`) after extraction.  
- No manual editing of the raw data is required.  
- It relies primarily on **base R** functions and the **dplyr** or **data.table** package (depending on the version).

---

 **E. Variable Description**

| `subjectID` | Numeric identifier of each participant (1–30). |
| `activityName` | The name of the performed activity (e.g., WALKING, STANDING, LAYING). |
| Remaining columns | 66 averaged signal measurements from accelerometer and gyroscope data representing the mean and standard deviation for each variable. |

**Additional internal variables used within the R script:**  
- `x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, `subject_test`: raw data components.  
- `train`, `test`: combined intermediate datasets.  
- `features`: feature names applied to column headers.  
- `tidy_data`: final summarized dataset with averages grouped by subject and activity.




**Oscar Mauricio Trigueros Miranda**  
*Getting and Cleaning Data – Coursera (Johns Hopkins University)*
