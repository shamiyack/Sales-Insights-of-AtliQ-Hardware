                                
                                /*BASIC ANALYSIS*/

USE sales;
SELECT * FROM customers;
SELECT * FROM date;
SELECT * FROM markets;
SELECT * FROM products;
SELECT * FROM transactions;

/*Total number of transactions*/
SELECT 
    COUNT(*)
FROM
    transactions;
    

/*Total no of Transactions in Chennai*/
SELECT 
    COUNT(*)
FROM
    transactions
WHERE
    market_code = 'Mark001';
    
    
/* transaction in year 2020*/
SELECT 
    *
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    year = 2020;
    

/*Total revenue in Year 2020*/
SELECT 
    SUM(sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    year = 2020;
    
    
/*Total revenue in Year 2019*/
SELECT 
    SUM(sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    year = 2019;


/*Total revenue Of Chennai in 2020*/
SELECT 
    SUM(sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    year = 2019 AND market_code = 'Mark001';
    

/*Distinct products sold at Chennai*/
SELECT DISTINCT
    product_code
FROM
    transactions
WHERE
    market_code = 'Mark001';


/*ADVANCED ANALYTICS*/

/* Revenue breakdown by cities*/
SELECT 
    markets.markets_name, transactions.sales_amount
FROM
    transactions
        INNER JOIN
    markets
WHERE
    transactions.market_code = markets.markets_code
ORDER BY sales_amount DESC;


/* Revenue breakdown by years and months*/
SELECT 
    date.date_yy_mmm, transactions.sales_amount
FROM
    transactions
        INNER JOIN
    date
WHERE
    transactions.order_date = date.date
ORDER BY sales_amount DESC;

/*Top 5 customers by Revenue*/
SELECT DISTINCT
    customers.custmer_name, transactions.sales_amount
FROM
    transactions
        INNER JOIN
    customers ON transactions.customer_code = customers.customer_code
ORDER BY sales_amount DESC
LIMIT 5;

/*Top 5 products by Revenue*/
SELECT 
    product_code, sales_amount
FROM
    transactions
ORDER BY sales_amount DESC
LIMIT 5;

SELECT 
    SUM(sales_amount)
FROM
    transactions
        INNER JOIN
    date ON transactions.order_date = date.date
WHERE
    year = 2020 AND month_name='January';