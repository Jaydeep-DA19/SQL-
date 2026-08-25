CREATE DATABASE SalesAnalyticsDB;

USE SalesAnalyticsDB;

CREATE TABLE Customerss (
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(100),
	age INT,
	country VARCHAR(50),
	amount_spend DECIMAL(10,2)
);

INSERT INTO customerss
(customer_id, customer_name, age, country, amount_spend)
VALUES
(1, 'Aarav Mehta', 28, 'India', 35000),
(2, 'Liam Martin', 27, 'Canada', 22000),
(3, 'Emily Johnson', 24, 'USA', 28000),
(4, 'Sneha Desai', 26, 'India', 48000),
(5, 'Vikram Shah', 39, 'India', 75000),
(6, 'Felix Weber', 55, 'Germany', 95000),
(7, 'Isabella Taylor', 23, 'UK', 15000),
(8, 'Mia White', 25, 'Australia', 12500),
(9, 'John Smith', 31, 'USA', 55000),
(10, 'Priya Sharma', 34, 'India', 62000),
(11, 'Anna Schmidt', 22, 'Germany', 19000),
(12, 'Michael Brown', 42, 'USA', 92000),
(13, 'Noah Thompson', 30, 'Australia', 41000),
(14, 'Rahul Patel', 45, 'India', 18000),
(15, 'Oliver Wilson', 37, 'UK', 67000),
(16, 'Charlotte Moore', 36, 'Canada', 58000),
(17, 'Jack Harris', 48, 'Australia', 83000),
(18, 'Sophia Davis', 29, 'USA', 45000),
(19, 'George Anderson', 51, 'UK', 32000),
(20, 'Hans Muller', 40, 'Germany', 52000);

select * 
from Customerss;

-- Customer Information
 select customer_name, age , country
 from Customerss;

 -- Customer Spending Analysis
select customer_name, country,amount_spend
from Customerss;

--High-Value Customers 
select customer_name
from Customerss
where amount_spend >50000;

-- Young Customers
SELECT customer_name , country 
from Customerss
where age<30;

--Customers from India
SELECT customer_name, age, country
from Customerss
where country = 'India';

--Low-Spending Customers
SELECT customer_name,age,country
from Customerss
where amount_spend<20000;

--High-Spending Young Customers
SELECT customer_name,age, country , amount_spend
from Customerss
where age<30 and amount_spend>30000;


-- Indian High-Value Customers
SELECT customer_name, age, country, amount_spend
from Customerss
where country = 'India' and amount_spend>40000;


--Customers from Selected Countries
select * 
from Customerss
where country IN ('India','USA');

--High Spenders from Selected Countries
select *
from Customerss
where country IN ('India','USA') and amount_spend>50000;


--Exclude a Country
select * 
from Customerss
where country != 'India';


-- Sort Customers by Spending
select * 
from Customerss
ORDER BY amount_spend asc; 


-- Identify Top Spenders
select *
from Customerss
ORDER BY amount_spend desc;


--Sort by Age
select customer_name,age,country,amount_spend
from Customerss
ORDER BY age asc;


-- Target Customer Segment
select *
from Customerss
where age IN (25) and amount_spend>30000 and country IN ('India','USA')
ORDER BY amount_spend desc;


-- Business Analyst Challenge
select * 
from Customerss
where age >=30 AND amount_spend > 40000 and country != 'India'
ORDER BY amount_spend desc;


