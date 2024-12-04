create database financeproject;
use financeproject;
show tables;
select * from financial_dataset_8nov limit 10;

#Q1)  Write a query to calculate the total amount of money
 #   (sum of the transaction amounts) for each transaction type.
 
select Category,sum(Amount) from financial_dataset_8nov group by Category;
 
SELECT * FROM financial_dataset_8nov
WHERE Amount IS NOT NULL
  AND Category IS NOT NULL
  AND Merchant IS NOT NULL
  AND Notes IS NOT NULL
  AND TRIM(Amount) <> ''
  AND TRIM(Category) <> ''
  AND TRIM(Merchant) <> ''
  AND TRIM(Notes) <> '';

#2) Write a query to find the number of transactions that occurred in each city.
select Location,count(TransactionID) as No_Of_transaction  from financial_dataset_8nov group by Location;

#3) Write a query to calculate the total amount spent (sum of negative values in the transaction amount) for each city.
SELECT 
    Location AS City,
    SUM(ABS(Amount)) AS Total_Spent
FROM 
    financial_dataset_8nov
WHERE 
    Amount < 0
GROUP BY 
    Location;

#4)  Write a query to find the highest and lowest transaction amount across all transactions.
SELECT 
    MAX(Amount) AS Highest_Transaction_Amount,
    MIN(Amount) AS Lowest_Transaction_Amount
FROM 
    financial_dataset_8nov;


#5)  Write a query to find the total amount spent by each store (sum of all transactions for each store).
SELECT Merchant AS Store,SUM(Amount) AS Total_Spent FROM financial_dataset_8nov  GROUP BY Merchant;


#6)  Write a query to list all transactions that occurred on '2020-01-01' (use the timestamp).
SELECT * FROM 
    financial_dataset_8nov
WHERE 
    DATE(Date) = '2020-01-01';


#7)  Write a query to find transactions where the amount is missing (i.e., blank or NULL values).
SELECT * FROM financial_dataset_8nov WHERE Amount IS NULL OR Amount = '';


#8)  Write a query to find the average transaction amount grouped by currency (USD, EUR, GBP).
SELECT Currency,AVG(Amount) AS Average_Transaction_Amount FROM 
    financial_dataset_8nov
GROUP BY 
    Currency;


#9)  Write a query to find the total amount for transactions made using debit cards versus credit cards.
SELECT PaymentMethod,SUM(Amount) AS Total_Amount FROM financial_dataset_8nov GROUP BY PaymentMethod;


#10) Write a query to count how many transactions have the description 'Gift'.
SELECT COUNT(*) AS Gift_Transactions from financial_dataset_8nov WHERE Notes = 'Gift';


#11) Write a query to find all transactions that have the description 'Refund'.
SELECT * FROM financial_dataset_8nov WHERE Notes = 'Refund';


#12) Write a query to find the total amount spent on 'Utilities' transactions.
SELECT SUM(ABS(Amount)) AS Total_Spent_On_Utilities
FROM 
    financial_dataset_8nov
WHERE 
    Category = 'Utilities' AND Amount < 0;


#13) Write a query to find the most recent transaction for each store (based on timestamp).
SELECT Merchant AS Store,MAX(Date) AS Most_Recent_Transaction FROM financial_dataset_8nov GROUP BY Merchant;


#14) Write a query to count the number of transactions for each payment method (Debit Card, Credit Card).
SELECT PaymentMethod,COUNT(*) AS Transaction_Count FROM financial_dataset_8nov GROUP BY PaymentMethod;


#15)  Write a query to find the top 5 highest transaction amounts across all transactions.

SELECT * FROM  financial_dataset_8nov ORDER BY Amount DESC LIMIT 5;
