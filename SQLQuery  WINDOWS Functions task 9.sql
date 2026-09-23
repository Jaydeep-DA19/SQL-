USE WINDOWSdB;

/* SQL Window Functions — 30 Tasks */



/* Part A — Basic Ranking Functions */

/*  Task 1 — Rank Employees by Salary
Display employee name, department, salary, and their rank based on salary from highest to lowest.

Hint: RANK() OVER (...)  */

SELECT
employee_name,
department,
salary,
RANK() OVER(	
	ORDER BY Salary DESC 
	) AS Salary_rank
FROM EmployeeSales;


/*  Task 2 — Dense Rank Employees
Display all employees with their salary and dense rank within the company.

Hint: DENSE_RANK()  */


SELECT 
employee_name,
salary,
DENSE_RANK() OVER(
	ORDER BY Salary DESC
	) AS Salary_rank
FROM EmployeeSales;


/* Task 3 — Row Number for Employees
Assign a unique row number to every employee based on salary from highest to lowest.

Hint: ROW_NUMBER()  */

SELECT
employee_name,
salary,
ROW_NUMBER() OVER(
		ORDER BY Salary DESC
		) AS row_num
FROM EmployeeSales;


/* Task 4 — Rank Employees Within Department
Rank employees based on salary separately within each department.

Hint: PARTITION BY department */

SELECT
employee_name,
department,
salary,
AVG(salary) OVER(
	PARTITION BY department
)	AS department_salary
FROM EmployeeSales;




/*  Task 5 — Top 3 Employees in Each Department
Find the top 3 highest-paid employees from every department.

Hint: Use ROW_NUMBER() or DENSE_RANK() with PARTITION BY.  */

SELECT TOP 3
employee_name,
salary,
ROW_NUMBER() OVER(
	PARTITION BY department
	ORDER BY salary DESC
) AS row_num
FROM EmployeeSales;



--- Part B — Partitioning ---


/*Task 6 — Department Average Salary
Display:

Employee name ,Department ,Salary ,Average salary of their department

Hint: AVG() OVER(PARTITION BY ...)  */

SELECT
employee_name,
department,
salary,
AVG(salary) OVER(
	PARTITION BY department
) AS department_avg
FROM EmployeeSales;



/* Task 7 — Difference from Department Average
Display each employee's salary and the difference between their salary and their department's average salary.

Hint: Salary − AVG() OVER(...)   */

SELECT
employee_name,
department,
salary,
AVG(salary) OVER(
	PARTITION BY department
) AS department_avg
FROM EmployeeSales;


/*  Task 8 — Department Total Salary

Display every employee along with the total salary paid to their department.

Hint: SUM() OVER(PARTITION BY department) */

SELECT
employee_name,
department,
salary,
SUM(salary) OVER(
	PARTITION BY department
) AS department_total
FROM EmployeeSales;

/* Task 9 — Employee Salary Percentage
Calculate each employee's percentage contribution to their department's total salary.

Hint: salary / SUM(salary) OVER(...)  */

SELECT
employee_name,
department,
salary * 100/SUM(salary)  OVER(
	PARTITION BY department
) AS Employee_Salary_Percentage
FROM EmployeeSales;


/* Task 10 — Department Employee Count
Display every employee along with the total number of employees working in their department.

Hint: COUNT(*) OVER(PARTITION BY department)  */

SELECT
employee_name,
department,
COUNT(*) OVER(
	PARTITION BY Department
) AS Employees_in_Department
FROM EmployeeSales;



-- Part C — Aggregate Window Functions --


/* Task 11 — Running Sales Total
Display each sale along with the cumulative sales amount over time.

Hint: SUM(amount) OVER(ORDER BY sale_date) */

SELECT 
sale_date,
sales,
SUM(sales) OVER(
	ORDER BY sale_date
) AS running_total
FROM EmployeeSales;


/* Task 12 — Running Sales by Employee
Calculate the cumulative sales amount for each employee.

Hint: PARTITION BY employee_id ORDER BY sale_date */
	
SELECT
employee_name,
sale_date,
sales,
SUM(sales) OVER (
PARTITION BY Employee_id
ORDER BY sale_date
) AS customer_running_sales
FROM EmployeeSales;

 
/*  Task 13 — Running Quantity Sold
Calculate the running total of quantity sold based on sale date.

Hint: SUM(quantity) OVER(...)  */

SELECT
sale_date,
sales,
SUM(sales) OVER(
	ORDER BY sale_date
) AS Running_Quantity_Sold
FROM EmployeeSales;




SELECT * FROM EmployeeSales;