create database customer_segregation;
use customer_segregation;


select * from bank_transactions; -- show complete table

select * from bank_transactions limit 10; -- show only first 10 rows

describe bank_transactions; -- gives the column names and their type

select count(*) from bank_transactions; -- gives the count of rows (customers)


-- averages of age, income and transaction amount --


SELECT 
  AVG(TIMESTAMPDIFF(YEAR, CustomerDOB, CURDATE())) AS avg_age,
  AVG(CustAccountBalance) AS avg_account_balance,
  AVG(`TransactionAmount (INR)`) AS avg_transaction_amount
FROM bank_transactions;

SELECT AVG(age) AS avg_customer_age FROM (
  SELECT DISTINCT CustomerID, TIMESTAMPDIFF(YEAR, CustomerDOB, CURDATE()) AS age
  FROM bank_transactions
) AS unique_customers;       



SELECT AVG(age) AS avg_customer_age FROM (
  SELECT DISTINCT CustomerID,
    TIMESTAMPDIFF(YEAR, CustomerDOB_date, CURDATE()) AS age
  FROM bank_transactions
  WHERE CustomerDOB_date IS NOT NULL
) AS unique_customers;       -- avg age of customers
      



SELECT CustomerDOB, COUNT(*) AS count
FROM bank_transactions
GROUP BY CustomerDOB
ORDER BY count DESC
LIMIT 10;            -- segregates DOB and gives the head ocunt

SELECT CustomerDOB
FROM bank_transactions
WHERE CustomerDOB > CURDATE();     -- gives only the valid DOBs

SELECT *
FROM your_table_name
WHERE CustomerDOB IS NOT NULL
  AND CustomerDOB <> '1/1/1800'
  AND STR_TO_DATE(CustomerDOB, '%d/%m/%Y') IS NOT NULL;


ALTER TABLE bank_transactions ADD COLUMN CustomerDOB_date DATE;


SET SQL_SAFE_UPDATES = 0;

UPDATE bank_transactions
SET CustomerDOB_date = STR_TO_DATE(CustomerDOB, '%d/%m/%Y');



UPDATE bank_transactions
SET CustomerDOB_date = STR_TO_DATE(CustomerDOB, '%d/%m/%y')
WHERE CustomerDOB_date IS NULL;


UPDATE bank_transactions
SET CustomerDOB_date = STR_TO_DATE(CustomerDOB, '%d/%m/%Y')
WHERE CustomerDOB NOT IN ('nan', '', '1/1/1800')
  AND CustomerDOB_date IS NULL;
  
  UPDATE bank_transactions
SET CustomerDOB_date = STR_TO_DATE(CustomerDOB, '%d/%m/%y')
WHERE CustomerDOB NOT IN ('nan', '', '1/1/1800')
  AND CustomerDOB_date IS NULL;
-- ------------------------------------------------------------------

# Min-Max normalization

SELECT 
  MIN(CustAccountBalance) AS min_balance,
  MAX(CustAccountBalance) AS max_balance,
  MIN(`TransactionAmount (INR)`) AS min_transaction,
  MAX(`TransactionAmount (INR)`) AS max_transaction
FROM bank_transactions;


-- creating the Normalized table

select * from normalized_bank_transactions;


CREATE TABLE normalized_bank_transactions AS
SELECT 
  CustomerID,
  CustGender,
  CustLocation,
  CASE 
    WHEN TIMESTAMPDIFF(YEAR, CustomerDOB_date, CURDATE()) < 0 THEN NULL
    ELSE TIMESTAMPDIFF(YEAR, CustomerDOB_date, CURDATE())
  END AS Age,
  (CustAccountBalance - 0) / (115035495.1 - 0) AS Normalized_Account_Balance,
  (`TransactionAmount (INR)` - 0) / (720001.16 - 0) AS Normalized_Transaction_Amount
FROM bank_transactions
WHERE CustomerDOB_date IS NOT NULL;

select * from normalized_bank_transactions;



