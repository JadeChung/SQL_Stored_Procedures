DELIMITER //
CREATE PROCEDURE GetAverageSalary()
SELECT avg(Salary) AS "Average Salary"
FROM salaries
 //
Query OK, 0 rows affected (0.11 sec)

DELIMITER ;//
Call GetAverageSalary()
;//
    
 DELIMITER //
CREATE PROCEDURE AverageSalaryPerTitle()
SELECT title, avg(Salary)
FROM titles
INNER JOIN salaries ON titles.emp_no=salaries.emp_no
GROUP BY title
 //
call AverageSalaryPerTitle()//
    
    DELIMITER //
 CREATE PROCEDURE GetCountSalaryAmount(
 IN amount INTEGER
 )
 SELECT *
 FROM salaries
 WHERE salary = amount;
 //
 CALL GetCountSalaryAmount(55000)//
    
    DELIMITER //
CREATE PROCEDURE GetCountSalaryTitle(
IN amount INTEGER,
OUT total INTEGER
)
SELECT COUNT(*)
INTO total
FROM titles
INNER JOIN salaries ON titles.emp_no=salaries.emp_no
WHERE salary = amount;
    
SELECT @total;
    