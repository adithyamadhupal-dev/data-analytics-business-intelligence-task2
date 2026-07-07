CREATE TABLE Customers_Clean AS
SELECT DISTINCT
    c1 AS Customer_Name,
    c2 AS Customer_ID,
    c3 AS Segment,
    c4 AS Region
FROM Customers
WHERE c1 <> 'Customer_Name';

SELECT COUNT(*)
FROM Customers_Clean;

SELECT *
FROM Customers_Clean
LIMIT 10;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Customers_Clean;

CREATE TABLE Customers_Unique AS
SELECT
    Customer_ID,
    MIN(Customer_Name) AS Customer_Name,
    MIN(Segment) AS Segment,
    MIN(Region) AS Region
FROM Customers_Clean
GROUP BY Customer_ID;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Customers_Unique;

CREATE TABLE Customers_Better AS
WITH RankedRegions AS (
    SELECT
        Customer_ID,
        Customer_Name,
        Segment,
        Region,
        COUNT(*) AS Region_Count,
        ROW_NUMBER() OVER (
            PARTITION BY Customer_ID
            ORDER BY COUNT(*) DESC, Region
        ) AS rn
    FROM Customers_Clean
    GROUP BY
        Customer_ID,
        Customer_Name,
        Segment,
        Region
)
SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    Region
FROM RankedRegions
WHERE rn = 1;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM Customers_Better;

SELECT *
FROM Customers_Better
LIMIT 10;

PRAGMA table_info(Orders);

CREATE TABLE Orders_Clean AS
SELECT
    c1 AS Order_ID,
    c2 AS Order_Date,
    c3 AS Customer_ID,
    c4 AS Product_Category,
    c5 AS Discount,
    c6 AS Profit,
    c7 AS Quantity,
    c8 AS Sales
FROM Orders
WHERE c1 <> 'Order_ID';

SELECT *
FROM Orders_Clean
LIMIT 10;

SELECT COUNT(*)
FROM Orders_Clean;

SELECT COUNT(*)
FROM Orders_Clean
WHERE Customer_ID IS NULL
   OR TRIM(Customer_ID) = ''
   




CREATE TABLE Orders_Clean AS
SELECT
    c1 AS Order_ID,
    c2 AS Order_Date,
    c3 AS Customer_ID,
    c4 AS Product_Category,
    c5 AS Region,
    c6 AS Discount,
    c7 AS Profit,
    c8 AS Quantity,
    c9 AS Sales
FROM Orders
WHERE c1 <> 'Order_ID';

SELECT *
FROM Orders_Clean
LIMIT 10;

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM Orders_Clean
GROUP BY Region
ORDER BY Total_Sales DESC;

DROP TABLE IF EXISTS Orders_Clean;

CREATE TABLE Orders_Clean AS
SELECT
    c1 AS Order_ID,
    c2 AS Order_Date,
    c3 AS Customer_ID,
    c4 AS Product_Category,
    c5 AS Discount,
    c6 AS Profit,
    c7 AS Quantity,
    c8 AS Sales,
    c9 AS Region
FROM Orders
WHERE c1 <> 'Order_ID';

SELECT *
FROM Orders_Clean
LIMIT 10;

SELECT
    Region,
    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Total_Sales
FROM Orders_Clean
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT
    Product_Category,
    ROUND(
        100.0 * SUM(CAST(Profit AS REAL))
        / NULLIF(SUM(CAST(Sales AS REAL)), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Orders_Clean
GROUP BY Product_Category
ORDER BY Profit_Margin_Percentage DESC;

SELECT
    strftime('%Y-%m', Order_Date) AS Month,
    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Monthly_Sales
FROM Orders_Clean
GROUP BY Month
ORDER BY Month;

SELECT
    substr(Order_Date, length(Order_Date) - 3, 4) || '-' ||
    printf('%02d', CAST(
        substr(Order_Date, 1, instr(Order_Date, '/') - 1
        ) AS INTEGER
    )) AS Month,

    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Monthly_Sales

FROM Orders_Clean

GROUP BY Month
ORDER BY Month;

SELECT
    c.Customer_Name,
    ROUND(SUM(CAST(o.Sales AS REAL)), 2) AS Total_Revenue
FROM Orders_Clean o
INNER JOIN Customers_Better c
    ON o.Customer_ID = c.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT
    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Total_Sales,
    ROUND(SUM(CAST(Profit AS REAL)), 2) AS Total_Profit,
    ROUND(
        100.0 * SUM(CAST(Profit AS REAL))
        / NULLIF(SUM(CAST(Sales AS REAL)), 0),
        2
    ) AS Profit_Margin_Percentage,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Orders_Clean;

SELECT
    c.Segment,
    ROUND(SUM(CAST(o.Sales AS REAL)), 2) AS Total_Sales,
    ROUND(SUM(CAST(o.Profit AS REAL)), 2) AS Total_Profit
FROM Orders_Clean o
INNER JOIN Customers_Better c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Segment
ORDER BY Total_Profit DESC;

SELECT
    CASE
        WHEN CAST(Discount AS REAL) = 0 THEN 'No Discount'
        WHEN CAST(Discount AS REAL) <= 0.10 THEN 'Low Discount'
        WHEN CAST(Discount AS REAL) <= 0.20 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS Discount_Level,

    ROUND(AVG(CAST(Discount AS REAL)) * 100, 2) AS Avg_Discount_Percentage,

    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Total_Sales,

    ROUND(SUM(CAST(Profit AS REAL)), 2) AS Total_Profit,

    ROUND(
        100.0 * SUM(CAST(Profit AS REAL))
        / NULLIF(SUM(CAST(Sales AS REAL)), 0),
        2
    ) AS Profit_Margin_Percentage

FROM Orders_Clean
GROUP BY Discount_Level
ORDER BY Avg_Discount_Percentage;

SELECT
    substr(Order_Date, length(Order_Date) - 3, 4) || '-' ||
    printf(
        '%02d',
        CAST(
            substr(
                Order_Date,
                1,
                instr(Order_Date, '/') - 1
            ) AS INTEGER
        )
    ) AS Month,

    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Monthly_Sales

FROM Orders_Clean

GROUP BY Month
ORDER BY Month;

SELECT
    substr(Order_Date, length(Order_Date) - 3, 4) || '-' ||
    printf(
        '%02d',
        CAST(
            substr(
                Order_Date,
                1,
                instr(Order_Date, '/') - 1
            ) AS INTEGER
        )
    ) AS Month,

    ROUND(SUM(CAST(Sales AS REAL)), 2) AS Monthly_Sales

FROM Orders_Clean
GROUP BY Month
ORDER BY Monthly_Sales DESC
LIMIT 10;