## sql-data-analysis-project
A detailed set of SQL scripts built for data analysis, reporting, and exploration. The collection includes examples for tasks like database inspection, metric calculations, time-series trends, cumulative reporting, segmentation, and more.
This repository is aimed at data analysts and BI professionals, providing ready-to-use SQL queries for efficient data exploration, segmentation, and analysis within relational databases. Each script highlights a particular analytical use case and illustrates SQL best practices.

## How to Run This Project

#### Prerequisites

SQL Server Express 
SQL Server Management Studio (SSMS) 

#### 1. Clone or Download the Repository


```bash
git clone https://github.com/francesco-mt/sql-data-analysis-project.git
```
Or download it as a ZIP from GitHub and extract it locally.

#### 2. Restore the Database Backup
This project includes a pre-built database backup file (DataWarehouseAnalytics (1).bak) that contains all the data needed to run the scripts.
Steps to restore in SSMS:

Open SSMS and connect to your local SQL Server instance
In the Object Explorer, right-click on Databases → Restore Database...
Under Source, select Device → click the ... button → Add
Navigate to the cloned repository folder and select DataWarehouseAnalytics (1).bak
Click OK → then OK again to start the restore
Once complete, you should see DataWarehouseAnalytics appear under Databases in Object Explorer


#### 3. Run the SQL Scripts

In SSMS, click File → Open → File... and navigate to the scripts/ folder
Open any script you want to explore
Make sure the correct database is selected in the dropdown at the top of the query window (DataWarehouseAnalytics)
Press F5 or click Execute to run the script

Each script is self-contained and focuses on a specific analytical use case such as time-series trends, segmentation, cumulative reporting, and more.

##  License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## Acknowledgment

This project was developed by following the guidelines and structure provided in a tutorial created by [DataWithBaara](https://github.com/DataWithBaraa/sql-data-analytics-project/commits?author=DataWithBaraa). The original concept and teaching approach belong to the author. All SQL scripts in this repository were written in order to carry out tasks and meet requirements dictated by the author but were written by me, while adopting a similar style and methodology for learning purposes.


