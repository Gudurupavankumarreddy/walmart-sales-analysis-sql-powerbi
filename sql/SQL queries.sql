create database walmart_analysis;
use walmart_analysis;

CREATE TABLE walmart_sales (
    Store INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Holiday_Flag INT,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    CPI FLOAT,
    Unemployment FLOAT
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Walmart.csv'
INTO TABLE walmart_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  Store,
  @Date,
  Weekly_Sales,
  Holiday_Flag,
  Temperature,
  Fuel_Price,
  CPI,
  Unemployment
)
SET Date = STR_TO_DATE(@Date, '%d-%m-%Y');

select Date from walmart_sales limit 10;

select * from walmart_sales;

alter table walmart_sales rename to walmart;

select * from walmart;

----  Row Count & Date Range

SELECT 
    COUNT(*) AS total_rows,
    MIN(Date) AS start_date,
    MAX(Date) AS end_date
FROM
    walmart;

---- Check Holiday Flag Validity

SELECT 
    Holiday_Flag, COUNT(*) AS records
FROM
    walmart
GROUP BY Holiday_Flag;

---- Negative or Zero Sales Check

SELECT 
    *
FROM
    walmart
WHERE
    Weekly_Sales <= 0;
    
---- Total & Average Sales

SELECT 
    SUM(Weekly_Sales) AS total_sales,
    AVG(Weekly_Sales) AS avg_sales
FROM
    walmart;
    
---- Yearly Sales Trend

SELECT 
    YEAR(Date) AS year, SUM(Weekly_Sales) AS total_sales
FROM
    walmart
GROUP BY year
ORDER BY year;

---- Monthly Seasonality

SELECT 
    MONTH(Date) AS month, SUM(Weekly_Sales) AS total_sales
FROM
    walmart
GROUP BY month
ORDER BY month;

---- Holiday vs Non-Holiday Sales
---- Total Weekly_Sales for Holiday vs Non Holiday 

SELECT 
    Holiday_Flag, SUM(Weekly_Sales) AS total_sales
FROM
    walmart
GROUP BY Holiday_Flag;


---- Average Weekly Sales for Holiday vs Non-Holiday

SELECT 
    CASE
        WHEN Holiday_Flag = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS week_type,
    ROUND(AVG(Weekly_Sales), 2) AS avg_weekly_sales
FROM
    walmart
GROUP BY week_type;


---- Holiday Lift %
---- Calculates the percentage increase in average weekly sales during holidays compared to non-holiday weeks

/* 
“This query calculates the percentage increase in average weekly sales during holidays compared to normal weeks,
 with protection against division by zero.”
 
 Why did i use NULLIF?
 "To avoid division by zero and ensure the query doesn’t fail if non-holiday sales are missing.”
 */

SELECT 
    ROUND(((AVG(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales END) - AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END)) /
            NULLIF(AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END), 0)) * 100, 2) AS holiday_lift_percentage
FROM walmart;

    
---- Top 10 Stores by Revenue

SELECT 
    store, SUM(Weekly_Sales) AS total_sales
FROM
    walmart
GROUP BY store
ORDER BY total_sales DESC
LIMIT 10;


---- Store Ranking Using Window Functions 

SELECT
    Store,
    SUM(Weekly_Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Weekly_Sales) DESC) AS store_rank
FROM walmart
GROUP BY Store;


---- Store-Wise Holiday Lift 
---- Calculates holiday lift for EACH STORE separately
---- Compares holiday vs non-holiday average sales within the same store

/* I calculated store-wise holiday lift and used a HAVING clause 
to ensure each store had sufficient holiday and non-holiday data, preventing misleading averages.
*/

SELECT 
    Store,
    ((AVG(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales END) - AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END)) /
        AVG(CASE WHEN Holiday_Flag = 0 THEN Weekly_Sales END)) * 100 AS holiday_lift_percentage
FROM walmart
GROUP BY Store
HAVING
    COUNT(CASE WHEN Holiday_Flag = 1 THEN 1 END) >= 2
AND COUNT(CASE WHEN Holiday_Flag = 0 THEN 1 END) >= 2
ORDER BY holiday_lift_percentage DESC;



---- Yearly Sales View

CREATE VIEW vw_yearly_sales AS
SELECT
    YEAR(Date) AS year,
    SUM(Weekly_Sales) AS total_sales
FROM walmart
GROUP BY year;

---- Monthly Sales view 

CREATE VIEW vw_monthly_seasonality AS
SELECT
    MONTH(Date) AS month,
    AVG(Weekly_Sales) AS avg_weekly_sales
FROM walmart
GROUP BY month;

---- Store Performance View

CREATE VIEW vw_store_performance AS
SELECT
    Store,
    SUM(Weekly_Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Weekly_Sales) DESC) AS store_rank
FROM walmart
GROUP BY Store;


SHOW FULL TABLES WHERE Table_type = 'VIEW';










    
    
    
    




