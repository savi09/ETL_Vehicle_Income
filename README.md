# ETL_Vehicle_Income
Extract Transform and Load process to pgAdmin with Vehicle Data and Income Tax Data.

## Three steps:
#### 1. Extract: your original data sources and how the data was formatted (CSV, JSON, pgAdmin 4, etc).

My two original data sources were:
 * [zip_income_info](https://github.com/savi09/ETL_Vehicle_Income/blob/main/Resources/zip_income_info.csv)
  
    * This source is a CSV file.
    * It includes the total populatio, total income, average income, and country by Zip Code for 50 states for 2018.
    * It came from [kaggle.com](https://www.kaggle.com/hamishgunasekara/average-income-per-zip-code-usa-2018)

 * [zip_vehicle_info](https://github.com/savi09/ETL_Vehicle_Income/blob/main/Resources/zip_vehicle_info.csv)

    * This source is, also, a CSV file.
    * It includes the date this information was captured, vehicle model year, vehicle fuel type, vehicle make, light/heavy duty vehicle, and the number of vehicles in this category by Zip Code for 2018.
    * It came from [California Open Data Portal](https://data.ca.gov/dataset/vehicle-fuel-type-count-by-zip-code/resource/d304108a-06c1-462f-a144-981dd0109900)

#### 2. Transform: what data cleaning or transformation was required.
  
  Inital Clean up:
    
    Began by cleaning zip_income_info table. I dropped all records that were not from California, dropped records with 
    zip codes that had a value of 0, dropped the "Country" column, and added a column for the year the data sourced. In 
    this case the year was 2018. The columns were renamed/formatted to match the tables in the database. The columns 
    total_income, avg_income, and total_pop were formatted to include commas and "$" where appropriate. When I tried to 
    load the data to the database, I realized formatting was going to be an issue with my data type so I reverted to the 
    original format.
    
    Only minor changes were made to zip_vehicle_info for the inital clean-up. I dropped records with zip codes that had 
    a value of "OOS" and "Other", added a column for the year the data sourced, and the columns were renamed/formatted 
    to match the tables in the database.
  
#### 3. Load: the final database, tables/collections, and why this was chosen.

The final database, vehicle_income_zip, includes three table: zip_vehicle_info, zip_avg_income, and zip_vehicle_income. The table, zip_vehicle_info includes all data from the original file, [zip_vehicle_info](https://github.com/savi09/ETL_Vehicle_Income/blob/main/Resources/zip_vehicle_info.csv), except for the following changes:
  * Bad zip codes (OOS & Other) were dropped
  * Added a year column for the year the data sourced from

The table, zip_avg_income includes all California data from the original file, [zip_income_info](https://github.com/savi09/ETL_Vehicle_Income/blob/main/Resources/zip_income_info.csv), except for the following changes:
  * Bad zip codes (0) were dropped
  * Country Column was dropped
  * Added a year column for the year the data sourced from

The table, zip_vehicle_income includes the state, zip code, total population, total income, average income, the year the data is sourced from and the number of newer vehicles (less than 5 years old) in that zip code. I chose to keep most of the original data sources, because they contain useful data that we might want to use in the future. I created the merged table so that the data transformation for merging is automated. No need to go through the cleaning process again if you can just run all the cells in the Jupyter Notebook.
