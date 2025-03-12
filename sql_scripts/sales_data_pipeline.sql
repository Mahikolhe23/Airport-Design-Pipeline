USE Practise_db
GO

--FIND TOP 5 HIGHEST SELLING PRODUCTS IN EACH REGION
WITH CTE AS (
    SELECT product_id, region,SUM([sale price]) AS 'sales'
    FROM ORDERS
    GROUP BY region,product_id
) 
SELECT * FROM (
SELECT *, ROW_NUMBER() OVER(PARTITION BY region ORDER BY sales DESC) AS rank
FROM CTE
) temp 
WHERE rank <=5


--FIND MONTH OVER MONTH GROWTH COMPARISON FOR 2022 AND 2023 SALES EG : JAN 2022 VS JAN 2023
;WITH CTE AS (
    SELECT YEAR(order_date) AS order_year , MONTH(order_date) AS order_month, SUM([sale price]) AS 'sales'
    FROM orders 
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT order_month,
SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM CTE
GROUP BY order_month
ORDER BY order_month


--FOR EACH CATEGORY WHICH MONTH HAD HIGHEST SALES
;WITH CTE AS (
    SELECT category, MONTH(order_date) AS 'Month', SUM([sale price]) AS 'sales'
    FROM orders
    GROUP BY category,MONTH(order_date)
)
SELECT * FROM (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rnk
FROM CTE) t
WHERE  rnk = 1


--WHICH SUB CATEGORY HAD HIGHEST GROWTH BY PROFIT IN 2023 COMPARE TO 2022
;WITH CTE1 AS (
    SELECT sub_category, SUM([sale price]) AS 'sales', YEAR(order_date) AS 'order_year'
    FROM orders 
    GROUP BY sub_category, YEAR(order_date)
) 
,CTE2 AS (
    SELECT sub_category,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022, 
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023 
    FROM CTE1
    GROUP BY sub_category
)
SELECT TOP 1 * , (sales_2023 - sales_2022) AS 'highest_sales'
FROM CTE2
ORDER BY (sales_2023 - sales_2022) DESC

