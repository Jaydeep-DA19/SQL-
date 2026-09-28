use sql1;

/* 1. Display all records from the samplesuperstore table. */

select * from samplesuperstore;

/* 2. Display only: Order_ID,Order_Date,Customer_Name,Category,Sales,Profit */

SELECT 
Order_ID,
Order_Date,
Customer_Name,
Category,
Sales,
Profit
FROM samplesuperstore;

/* 3. Find all orders where Sales is greater than 500.*/

SELECT 
Order_ID,
Category,
Customer_ID,
Customer_Name,
Sales
FROM samplesuperstore
WHERE Sales > 500;

/* 4.  Find all products where Profit is negative.*/

SELECT 
Product_ID,
Product_Name,
Profit
FROM samplesuperstore
WHERE Profit < 0;

/*5. Find all orders belonging to the Consumer segment.*/

SELECT 
Order_ID,
Customer_ID,
Customer_Name
FROM samplesuperstore
WHERE Segment = 'Consumer';



/*6. Display all orders from the Technology category.*/

SELECT
Order_ID,
Customer_ID,
Customer_Name
FROM samplesuperstore
WHERE Category = 'Technology';

/*7. Find all orders where Discount is greater than 0.20. */

 SELECT
 Order_ID,
 Customer_ID,
 Customer_Name,
 Discount
 FROM samplesuperstore
 WHERE Discount > 0.20;

/* 8. Display orders shipped using First Class. */

SELECT 
Order_ID,
Order_Date,
Customer_ID,
Customer_Name
FROM samplesuperstore
WHERE Ship_Mode = 'First Class';

/* 9. Find all records from the West region. */

SELECT *
FROM samplesuperstore
WHERE Region = 'West';

/* 10. Display products whose name contains the word Chair.*/

SELECT 
Order_ID,
Order_Date,
Customer_ID,
Customer_Name,
Product_ID,
Product_Name
FROM samplesuperstore
WHERE Product_Name LIKE '%Chair';  /* USE LIKE Clause when to find any particular word  WITH % */


/* Level 2 — Sorting & DISTINCT */


/* 11. Display the 20 highest-sales orders. */

 SELECT TOP 20 *
 FROM samplesuperstore
 ORDER BY Sales DESC;

/* 12. Display the 20 orders with the lowest profit.*/

SELECT TOP 20 *
FROM samplesuperstore
ORDER BY Sales ASC;


/* 13. Display all unique:
*   Categories
*   Sub-Categories    
*   Segments    
*   Regions  */

SELECT DISTINCT
Category,
Sub_Category,
Segment,
Region
FROM samplesuperstore;

/* 14. Display products sorted by Sales from highest to lowest. */

 SELECT 
 Order_ID,
 Order_Date,
 Customer_Name,
 Product_ID,
 Product_Name,
 Sales
 FROM samplesuperstore
 ORDER BY Sales DESC;

/* 15. Display products sorted by Profit from lowest to highest.*/

SELECT
Order_ID,
Order_Date,
Customer_Name,
Product_ID,
Product_Name,
Profit
FROM samplesuperstore
WHERE Profit > 1
ORDER BY Profit ASC ;


/* 16. Display customers alphabetically by Customer_Name. */

SELECT
Customer_Name
FROM samplesuperstore
ORDER BY Customer_Name ASC; 

/* 17. Display the orders with the highest discount. */

SELECT 
Order_ID,
Order_Date,
Customer_Name,
Product_Name,
Discount
FROM samplesuperstore
ORDER BY Discount DESC;

/* 18. Display the 10 most expensive individual sales transactions. */

SELECT TOP 10 *
FROM samplesuperstore
ORDER BY Sales DESC;


/* Level 3 — Aggregate Functions */

SELECT * FROM samplesuperstore;

/**/


/**/


/**/




