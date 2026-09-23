/*  SQL JOIN Practical Questions — 20 Tasks  */


USE JoinPracticeDB;


/* Task 1 — Customer Order Details
Write a query to display:

Customer ID
Customer Name
City
Order ID
Product Name
Amount
Use an INNER JOIN.*/

SELECT 
C.customer_id,
C.customer_name,
C.city,
O.order_id,
O.product_name,
O.amount
FROM Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;


/*  Task 2 — Customers With Orders
Display all customers who have placed an order.
Show:

Customer Name
City
Product Name
Order Amount
Use INNER JOIN.   */

SELECT 
C.customer_name,
C.city,
O.product_name,
O.amount
FROM Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;



/* Task 3 — All Customers
Display all customers, including customers who have not placed any orders.
Show:
Customer ID
Customer Name
Order ID
Product Name
Amount
Use LEFT JOIN.  */

SELECT 
C.customer_id,
C.customer_name,
O.order_id,
O.product_name,
O.amount
FROM Customer AS C 
LEFT JOIN Orders AS O 
ON C.customer_id = O.customer_id


/*  Task 4 — Customers Without Orders
Find all customers who have not placed any order.

Display:

Customer ID
Customer Name
City
Use LEFT JOIN.  */

SELECT 
C.customer_id,
C.customer_name,
O.amount
FROM Customer C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id;


/* Task 5 — All Orders
Display all orders, including orders whose customer does not exist in the Customers table.

Show:
Order ID
Customer ID
Customer Name
Product Name
Amount
Use RIGHT JOIN.     */

SELECT 
O.order_id,
O.customer_id,
C.customer_name,
O.product_name,
O.amount
FROM Customer C
RIGHT JOIN Orders O
ON C.customer_id = O.customer_id;


/* Task 6 — Orders Without Customers
Find all orders that do not have a matching customer.

Display:
Order ID
Customer ID
Product Name
Amount
Use RIGHT JOIN.  */

SELECT
O.order_id,
C.customer_id,
O.product_name,
O.amount
FROM Customer C
RIGHT JOIN Orders O
ON C.customer_id = O.customer_id;


/* Task 7 — Full Customer and Order Analysis
Use FULL OUTER JOIN to display all customers and all orders, whether they have a match or not.

Display:

Customer ID
Customer Name
Order ID
Product Name
Amount   */

SELECT 
C.customer_id,
C.customer_name,
O.order_id,
O.product_name,
O.amount
FROM Customer C 
FULL OUTER JOIN Orders O
ON C.customer_id = O.customer_id;

/*  Task 8 — Orders Above ₹10,000
Find customers whose order amount is greater than 10000.

Display:

Customer Name
Order ID
Product Name
Amount

Use: INNER JOIN ,  WHERE      */

SELECT 
C.customer_name,
O.order_id,
O.product_name,
O.amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
WHERE O.amount > 10000;


/* Task 9 — Customers From Delhi
Find all orders placed by customers from Delhi.
Display:

Customer Name
City
Order ID
Product Name
Amount
Use INNER JOIN.  */

SELECT 
C.customer_name,
C.city,
O.order_id,
O.product_name,
O.amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
WHERE C.city = 'Delhi';


/* Task 10 — Orders With Quantity Greater Than 2
Find all customers who ordered a quantity greater than 2.

Display:

Customer Name
Product Name
Quantity
Amount
Sort the result by quantity in descending order.  */

SELECT 
C.customer_name,
O.product_name,
O.quantity,
O.amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
WHERE O.quantity > 2
ORDER BY O.quantity DESC;


/*  Task 11 — Total Amount Spent by Each Customer
Calculate the total amount spent by every customer.

Display:

Customer ID
Customer Name
Total Amount
Customers who have not placed any orders should also appear.

Use:  LEFT JOIN ,GROUP BY, SUM()       */

SELECT 
C.customer_id,
C.customer_name,
SUM(O.amount) AS Total_Amount
FROM Customer C
LEFT JOIN ORDERS O
ON C.customer_id = O.customer_id
GROUP BY 
C.customer_id,
C.customer_name;


/* Task 12 — Number of Orders Per Customer
Find the total number of orders placed by each customer.

Display:
Customer ID
Customer Name
Total Orders
Customers with no orders should also appear.

Use:
LEFT JOIN , GROUP BY, COUNT()  */


SELECT
C.customer_id,
C.customer_name,
COUNT(O.order_id) AS Total_Orders
FROM Customer C 
LEFT JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id,
	C.customer_name;


/*   Task 13 — Average Order Amount
Calculate the average order amount for each customer.

Display:

Customer Name
Average Order Amount
Only display customers who have placed at least one order.

Use: INNER JOIN ,GROUP BY ,AVG()    */

SELECT 
C.customer_name,
O.quantity,
AVG(O.amount) AS Average_Order_Amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY
	C.customer_name,
	O.quantity;

/*  Task 14 — Highest Order Amount
Find the customer who placed the order with the highest amount.

Display: Customer Name ,Order ID ,Product Name ,Amount    */

SELECT
C.customer_name,
O.order_id,
O.product_name,
O.amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
ORDER BY O.amount DESC;


/*  Task 15 — Lowest Order Amount
Find the customer who placed the order with the lowest amount.

Display: Customer Name,Order ID,Product Name,Amount    */

SELECT 
C.customer_name,
O.order_id,
O.product_name,
O.amount
FROM Customer C
INNER JOIN Orders O
ON C.customer_id = O.customer_id
ORDER BY O.amount ASC;


/*  Task 16 — Customer Order Summary
Create a customer-wise summary containing:

Customer ID
Customer Name
Number of Orders
Total Quantity
Total Amount
Include customers who have no orders.

Use: LEFT JOIN,GROUP BY,COUNT(),SUM()   */

SELECT 
C.customer_id,
C.customer_name,
COUNT(O.order_id) AS Number_of_Orders,
SUM(O.quantity) AS Total_Quantity,
SUM(O.amount) AS Total_Amount
FROM Customer C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY
	C.customer_id,
	C.customer_name;


/* Task 17 — Customers With Total Spending Greater Than ₹20,000
Calculate the total amount spent by each customer.

Display only customers whose total spending is greater than ₹20,000.

Use: LEFT JOIN ,GROUP BY ,SUM() ,HAVING  */

SELECT 
C.customer_id,
C.customer_name,
SUM(O.amount) AS Total_Amount_Spent
FROM Customer C
LEFT JOIN ORDERS O
ON C.customer_id = O.customer_id
GROUP BY 
	C.customer_id,
	C.customer_name
HAVING SUM(O.amount) > 20000 ;


/*   Task 18 — Customers With More Than One Order
Find customers who have placed more than one order.

Display: Customer ID ,Customer Name ,Number of Orders

Use: JOIN,GROUP BY,COUNT(),HAVING */

SELECT 
C.customer_id,
C.customer_name,
COUNT(O.order_id) AS Number_Of_Orders
FROM Customer C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY 
	C.customer_id,
	C.customer_name
HAVING SUM(O.order_id) > 1;


/* Task 19 — Compare Matching and Unmatched Records
Using FULL OUTER JOIN, identify:

Customers who have orders
Customers who do not have orders
Orders whose customers do not exist

Display the appropriate customer and order information.*/


-- Customers who have orders --
SELECT
C.customer_id,
C.customer_name,
C.city,
O.order_id,
O.product_name,
O.quantity,
O.amount
FROM Customer C
FULL OUTER JOIN Orders O
ON C.customer_id = O.customer_id;

-- Customers who do not have orders -- 

SELECT
C.customer_id,
C.customer_name,
C.city
FROM Customer C
FULL OUTER JOIN Orders O
ON C.customer_id = O.customer_id
WHERE O.order_id IS NULL;


-- Orders whose customers do not exist -- 

SELECT 
O.order_id,
O.product_name,
O.quantity,
O.amount
FROM Customer C
FULL OUTER JOIN Orders O
ON C.customer_id = O.customer_id
WHERE C.customer_id IS NULL;


/*  Task 20 — Business Order Report
Create a complete order report using INNER JOIN.

The report should contain:

Customer ID,Customer Name,City,Order ID,Product Name,Quantity,Amount,Total Value

Calculate: Total Value = Quantity × Amount    */


SELECT 
C.customer_id,
C.customer_name,
C.city,
O.order_id,
O.product_name,
O.quantity,
O.amount,
O.quantity * O.amount AS Total_Value
FROM Customer C
INNER JOIN Orders O 
ON C.customer_id = O.customer_id;

