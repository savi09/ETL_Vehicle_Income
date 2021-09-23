-- Create tables for raw data to be loaded into
CREATE TABLE Zip_Vehicle_Info (
ID SERIAL PRIMARY KEY,
Date DATE,
Year INT,
Zip_Code INT,
Model_Year VARCHAR(50),
Fuel_Type VARCHAR(50),
Make TEXT,
Duty TEXT,
Count_Vehicles VARCHAR(50)
);

CREATE TABLE Zip_Avg_Income (
ID SERIAL PRIMARY KEY,
Year INT,
State TEXT,
Zip_Code INT,
Total_Pop INT,
Total_Income INT,
Country TEXT,
Avg_Income INT
);

CREATE TABLE Zip_Vehicle_Income (
ID SERIAL PRIMARY KEY,
Year INT,
Zip_Code INT,
Count_Vehicles VARCHAR(50),
Avg_Income INT,
Total_Pop INT,
Total_Income INT
);