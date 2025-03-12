USE Datawarehouse
GO

SELECT * FROM bronze.crm_cust_info
SELECT * FROM bronze.crm_prd_info
SELECT * FROM bronze.crm_sales_details

DROP TABLE IF EXISTS #temp_cust_info
SELECT 
c.cst_id AS customer_id,
c.cst_key AS customer_key,
TRIM(c.cst_firstname) AS first_name,
TRIM(c.cst_lastname) AS last_name,
TRIM(c.cst_firstname) + ' ' + TRIM(c.cst_lastname) AS full_name,
CASE 
    WHEN c.cst_marital_status = 'M' THEN 'Married'
    WHEN c.cst_marital_status = 'S' THEN 'Single'
    ELSE 'Unknown'
END AS marital_status,
CASE 
    WHEN c.cst_gndr = 'M' THEN 'Male'
    WHEN c.cst_gndr = 'F' THEN 'Female'
    ELSE 'Unknown'
END AS gender,
c.cst_create_date AS created_date        
INTO #temp_cust_info
FROM bronze.crm_cust_info AS c

SELECT * FROM #temp_cust_info
