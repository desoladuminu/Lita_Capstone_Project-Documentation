create Table salesdata(
orderID INT primary key,
customerId VARCHAR(250),
Product VARCHAR(250),
Region  VARCHAR(250),
OrderDate Date,
Quantity INT,
Unitprice DECIMAL(10,2),
TotalRevenue AS (Quantity*unitprice)
);


SELECT*FROM 
[dbo].[LITA_Capstone_Sales data]

-----The total sales for each product categoty----
SELECT product,
SUM(Quantity*unitprice) AS totalsales
FROM [dbo].[LITA_Capstone_Sales data]
Group BY
Product;


-----find the number of sales transactions in each regiom------
SELECT Region,
COUNT(OrderID) AS number_of_transactions
FROM [dbo].[LITA_Capstone_Sales data]
GROUP BY
REGION;

-----Find the highest selling product by total sales value----
SELECT  TOP 1 Product,
SUM(Quantity*unitprice) AS total_sales
FROM [dbo].[LITA_Capstone_Sales data]
GROUP BY
Product
ORDER BY
total_sales DESC;

----Calculate the total revenue per product----
SELECT Product,
SUM(Quantity*unitprice) AS total_revenue
FROM [dbo].[LITA_Sales data]
GROUP BY
Product;

-----calculate monthly sales totals for the current year----
SELECT DATEPART
(MONTH,  OrderDate) AS ordermonth,
SUM(Quantity*unitprice) AS total_sales
FROM [dbo].[LITA_Sales data]
WHERE DATEPART (YEAR, OrderDate)=YEAR (GETDATE())
GROUP BY
DATEPART (month,orderdate)
ORDER BY
ordermonth;

----find the top 5 customers by total purchase amount---
SELECT tOP (5) Customer_Id,
SUM(UnitPrice) AS total_purchase_amount
FROM [dbo].[LITA_Capstone_Sales data]
GROUP BY
Customer_Id
ORDER BY 
total_purchase_amount DESC

-----calculate the percentage of total sales contributed by each region----
SELECT Region,
SUM(UnitPrice) AS RegionTotalSales
FROM[dbo].[LITA_Capstone_Sales data]
GROUP BY 
Region
ORDER BY
RegionTotalSales DESC

-----Identify products with no sales in the last quarter-----
SELECT Product
FROM[dbo].[LITA_Capstone_Sales data]
GROUP BY
Product
HAVING SUM(CASE WHEN OrderDate BETWEEN '2024-06-01' AND '2024-08-31'
THEN 1 ELSE 0 END)=0



