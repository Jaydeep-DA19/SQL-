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
Product_Name,
Sub_Category
FROM samplesuperstore
WHERE Sub_Category LIKE '%Chair%';  /* USE LIKE Clause when to find any particular word  WITH % */
-- WHERE Sub_catgeory = 'chair', --

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



/* 19. Find the total sales.*/
 
 SELECT 
 SUM(Sales) AS Total_Sales
 FROM samplesuperstore;

/* 20. Find the total profit. */

 SELECT 
 SUM(Profit) AS Total_Profit
 FROM samplesuperstore;

/* 21. Find the average sales.*/

SELECT
AVG(Sales) AS Average_Sales
FROM samplesuperstore;

/* 22. Find the average profit.*/

SELECT
AVG(Profit) AS Average_Profit
FROM samplesuperstore;

/* 23. Find the minimum and maximum sales.*/

SELECT
MIN(Sales) AS Minimum_Sales,
MAX(Sales) AS Maximum_Sales
FROM samplesuperstore;

/* 24. Find the minimum and maximum profit.*/

SELECT
MIN(Profit) AS Minimum_profit,
MAX(Profit) AS Maximum_profit
FROM samplesuperstore;


/* 25. Count the total number of records.*/

SELECT
COUNT(Order_ID) AS total_number_of_records
FROM samplesuperstore;

/* 26. Count the number of unique customers. */

SELECT 
DISTINCT COUNT(Customer_Name) AS Unique_customers
FROM samplesuperstore;

/* 27. Count the number of unique products. */

SELECT
DISTINCT COUNT(Product_Name) AS Unique_Products
FROM samplesuperstore;


/* 28. Find the total quantity sold. */

SELECT
SUM(Quantity) AS Total_quantity_sold
FROM samplesuperstore;




/* Level 4 — GROUP BY  */



/* 29. Find total sales by category. */

SELECT Category,
SUM(Sales) AS Total_sales_by_category
FROM samplesuperstore
GROUP BY Category;


/* 30. Find total profit by category. */

SELECT Category,
SUM(Profit) AS Total_profit_by_catgeory
FROM samplesuperstore
GROUP BY Category;

/* 31. Find average sales by category.*/

SELECT Category,
AVG(Sales) AS Average_sales_by_category
FROM samplesuperstore 
GROUP BY Category;


/* 32. Find total sales by sub-category. */

SELECT Sub_Category,
SUM(Sales) AS Total_sales_by_subcategory
FROM samplesuperstore
GROUP BY Sub_Category;

/* 33. Find total profit by sub-category.*/

SELECT Sub_Category,
SUM(Profit) AS Total_profit_by_subcategory
FROM samplesuperstore
GROUP BY Sub_Category;

/* 34. Find total sales by region. */

SELECT Region,
SUM(Sales) AS Total_sales_by_region
FROM samplesuperstore
GROUP BY Region;


/* 35. Find total profit by region.*/

SELECT Region,
SUM(Profit) AS Total_profit_by_region
FROM samplesuperstore
GROUP BY Region;

/* 36. Find total sales by customer segment.*/

SELECT Segment,
SUM(Sales) AS Total_sales_by_customer_segment
FROM samplesuperstore
GROUP BY Segment; 

/* 37. Find total quantity sold by category. */

	SELECT Category,
	SUM(Quantity) AS Total_quantity_sold_by_category
	FROM samplesuperstore
	GROUP BY Category;


/* 38. Find the number of orders for each ship mode. */

SELECT Ship_Mode,
COUNT(Order_ID) AS Number_of_orders_for_each_ship_mode
FROM samplesuperstore
GROUP BY Ship_Mode;

/* 39. Find the number of customers in each segment.*/

SELECT Segment,
COUNT(Customer_ID) AS Number_of_customers
FROM samplesuperstore
GROUP BY Segment;


/* 40. Find total sales by state.*/

SELECT State_Province,
SUM(SALES) AS Total_sales_by_state
FROM samplesuperstore
GROUP BY State_Province;


/* Level 5 — HAVING  */



/* 41. Find categories whose total sales are greater than 100,000.  */

SELECT Category,
SUM(Sales) AS Total_sales
FROM samplesuperstore
GROUP BY Category
HAVING SUM(Sales) > 100000;


/* 42. Find sub-categories whose total profit is greater than 10,000. */

SELECT Sub_Category,
SUM(Profit) AS Total_profit
FROM samplesuperstore
GROUP BY Sub_Category
HAVING SUM(Profit) > 10000;


/* 43. Find customers whose total sales exceed 5,000. */

SELECT Customer_Name,
SUM(Sales) AS Total_sales
FROM samplesuperstore
GROUP BY Customer_Name
HAVING SUM(Sales) > 5000;

/* 44. Find states whose total sales exceed 50,000. */

SELECT State_Province,
SUM(Sales) AS Total_sales
FROM samplesuperstore
GROUP BY State_Province
HAVING SUM(Sales) > 50000;


/* 45. Find products whose total sales exceed 10,000.*/

SELECT Product_Name,
SUM(Sales) AS Total_sales
FROM samplesuperstore
GROUP BY Product_Name
HAVING SUM(Sales) > 10000;


/* 46. Find categories having an average discount greater than 20%. */

SELECT  Category,
AVG(Discount) AS Average_Discount
FROM samplesuperstore
GROUP BY Category
HAVING AVG(Discount) > 20;


/* 47. Find customers who have placed more than 10 orders. */

SELECT Customer_ID, 
Customer_Name,
COUNT(Order_ID) AS Total_Orders
FROM samplesuperstore
GROUP BY
Customer_ID,
Customer_Name
HAVING COUNT(Order_ID) > 10;

/* 48. Find sub-categories with total profit below 0.   */

SELECT Sub_Category,
SUM(Profit) AS Total_Profit
FROM samplesuperstore
GROUP BY Sub_Category
HAVING SUM(Profit) < 0;

-- Level 6 — CASE --


/* 49. Create a column called Profit_Status:

   Profit > 0      → Profitable  
   Profit < 0      → Loss  
   Profit = 0      → No Profit     */

   SELECT
   Customer_ID,
   Customer_Name,
   CASE 
	WHEN Profit > 0 THEN 'Profitable'
	WHEN Profit < 0 THEN  'Loss'
	ELSE 'No Profit'
	END AS Profit_Status			
   FROM samplesuperstore;


/* 50. Create a Sales_Category:

 Sales < 100       → Low  
  100–500           → Medium  
  501–1000          → High 
  >1000             → Very High  */

  SELECT Product_Name,
  CASE
	WHEN Sales < 100 THEN 'Low' 
	WHEN  SALES BETWEEN 100 AND 500 THEN 'Medium'
	WHEN  SALES BETWEEN 501 AND 1000 THEN 'High'
	WHEN Sales > 1000  THEN 'Very High'
	END AS Sales_catgeory
  FROM samplesuperstore;


/* 51. Classify discounts into:

 0              → No Discount  
 0–10%          → Low  
 10–30%         → Medium  
 >30%           → High   */


 SELECT Product_Name,
 CASE 
	WHEN Discount = 0 THEN 'No Discount'
	WHEN Discount BETWEEN 0 AND 10 THEN 'Low'
	WHEN Discount BETWEEN 10 AND 30 THEN 'Medium'
	WHEN Discount > 30 THEN 'High'
	END AS Classify_Discount
 FROM samplesuperstore;


/* 52. Calculate total sales and classify each category based on total sales.*/



-- Level 7 — Multiple Conditions -- 



/* 53. Find Consumer customers from the West region. */

SELECT 
Customer_ID,
Customer_Name,
Region
FROM samplesuperstore
WHERE Segment = 'Consumer'
AND  Region = 'West';


 

/* 54. Find Technology products with sales above 1,000.  */

SELECT Product_ID,
Product_Name,
Sales
FROM samplesuperstore
WHERE Category = 'Technology' 
AND Sales > 1000;


/* 55. Find orders where:
*   Sales > 500
*   Profit > 100
*   Discount < 20%  */




SELECT * FROM samplesuperstore;

/* 56. SELECT * FROM samplesuperstore */


