Create database PracticeDb;

use PracticeDb;

CREATE TABLE PracticeTable(
	id int not null,
	name varchar(50),
	department varchar(50),
	salary int,
	age  int
);

INSERT into PracticeTable(id,name, department, salary, age)
VALUES
(1,'Amit', 'IT', 60000, 28),
(2,'Sneha', 'HR',45000, 25),
(3, 'Raj' , 'Finance' , 70000, 32),
(4, 'Simran' , 'IT' , 52000, 27),
(5, 'Karan' , 'Marketing' , 40000, 24);

select * 
from PracticeTable

-- Salary > 40000
select id , name , department ,age
from PracticeTable
where salary >40000;

-- Department IT
select id , name , department ,age
from PracticeTable
where department = 'IT' ;

--Age between 25-30
select id , name, department, age
from PracticeTable
where age BETWEEN 25 AND 30;

--Name starts with S
SELECT id, name , department, age
from PracticeTable
where name like 'S%';

--Top 3 salaries
select * from PracticeTable
TOP = 5;
