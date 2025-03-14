USE Practise_db
GO

/*
Q1 - CREATE SEQUENCE USING SQL INCREMENTAL CTE 
*/

;WITH CTE AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1 FROM CTE WHERE Number < 50 
)
SELECT * FROM CTE 
GO

/*
Q2 - CREATE DATE SEQUENCE USING SQL INCREAMENTAL CTE
*/
;WITH CTE AS (
    SELECT CAST('2025-01-01' AS DATE) AS start_date, CAST('2025-01-07' AS DATE) AS end_date
    UNION ALL
    SELECT DATEADD(DAY,7,start_date),DATEADD(DAY,7,end_date) FROM CTE WHERE YEAR(start_date) = 2025   
)
SELECT * FROM CTE OPTION (MAXRECURSION 2000)
GO 

/*
Q3 - CREATE AGE CALCULATOR WITH DETAILS OF AGE IN VARIOUR FORM LIKE YEAR, MONTH, DAY
*/
DECLARE @dob DATE = '1996-05-23'
SELECT DATEDIFF(MONTH,@dob,GETDATE())/12 AS Years, DATEDIFF(MONTH,@dob,GETDATE())%12 AS Months

