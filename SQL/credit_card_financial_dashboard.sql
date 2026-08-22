-- Database Creation
CREATE DATABASE credit_card_dashboard;
USE credit_card_dashboard;

-- Table Creation
CREATE TABLE customer (
    Client_Num BIGINT,
    Customer_Age INT,
    Gender VARCHAR(20),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(50),
    state_cd VARCHAR(10),
    Zipcode INT,
    Car_Owner VARCHAR(10),
    House_Owner VARCHAR(10),
    Personal_loan VARCHAR(10),
    contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

CREATE TABLE credit_card (
    Client_Num BIGINT,
    Card_Category VARCHAR(50),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(20),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(20),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal DECIMAL(10,2),
    Total_Trans_Amt DECIMAL(10,2),
    Total_Trans_Vol INT,
    Avg_Utilization_Ratio DECIMAL(10,4),
    `Use Chip` VARCHAR(20),
    `Exp Type` VARCHAR(50),
    Interest_Earned DECIMAL(10,2),
    Delinquent_Acc VARCHAR(20)
);

-- Data Validation Queries
SELECT * FROM customer;
SELECT * FROM credit_card;

SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM credit_card;

-- KPI Queries
SELECT SUM(Total_Trans_Amt) AS Revenue
FROM credit_card;

SELECT SUM(Interest_Earned) AS Interest
FROM credit_card;

SELECT COUNT(DISTINCT Client_Num) AS Customers
FROM customer;

SELECT COUNT(*) AS Transactions
FROM credit_card;

SELECT SUM(Total_Trans_Vol) AS Transaction_Volume
FROM credit_card;

-- Business Analysis Queries
SELECT Gender,
       COUNT(*) AS Total_Customers
FROM customer
GROUP BY Gender;

SELECT Card_Category,
       SUM(Total_Trans_Amt) AS Revenue
FROM credit_card
GROUP BY Card_Category;

SELECT AVG(Income) AS Average_Income
FROM customer;

SELECT Qtr,
       SUM(Total_Trans_Amt) AS Revenue
FROM credit_card
GROUP BY Qtr;

SELECT `Exp Type`,
       SUM(Total_Trans_Amt) AS Revenue
FROM credit_card
GROUP BY `Exp Type`;
