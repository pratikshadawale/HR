/*---Q1:Write a query to display the names (first_name, last_name) using alias name “First Name", "Last
Name"---*/
SELECT first_name AS "First Name" , last_name AS "Last Name"
FROM employees; 


/*---Q2:Write a query to get unique department ID from employee table---*/
SELECT department_id
FROM employees;


/*---Q3:Write a query to get all employee details from the employee table order by first name, descending---*/
SELECT * FROM employees ORDER BY first_name desc;


/*---Q4:Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is
calculated as 15% of salary)---*/
SELECT first_name, last_name, salary, salary*.15 AS PF 
FROM employees;


/*---Q5:Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of
salary---*/
SELECT employee_id, first_name, last_name, salary FROM employees
ORDER BY SALARY asc;


/*---Q6:Write a query to get the total salaries payable to employees    Ans:691400---*/ 
SELECT sum(salary) FROM employees;


/*---Q7:Write a query to get the maximum and minimum salary from employees table     Ans:MAX-24000, MIN-2100---*/ 
SELECT min(salary) FROM employees;
SELECT max(salary) FROM employees;


/*---Q8:Write a query to get the average salary and number of employees in the employees table  
   Ans:Average salary-6461.682243, Number of employees-107---*/ 
SELECT avg(salary) FROM employees;
SELECT count(employee_id) FROM employees;


/*---Q9:Write a query to get the number of employees working with the company   Ans:Number of employees-107---*/
SELECT COUNT(employee_id) FROM employees;


/*---Q10:Write a query to get the number of jobs available in the employees table   Ans:Number of jobs-107---*/
SELECT COUNT(job_id) FROM employees;


/*---Q11:Write a query get all first name from employees table in upper case ---*/
SELECT upper(first_name) FROM employees;


/*---Q12:Write a query to get the first 3 characters of first name from employees table ---*/
SELECT SUBSTRING(first_name,1,3) FROM employees;


/*---Q13:Write a query to get first name from employees table after removing white spaces from both side ---*/
SELECT trim(first_name) FROM employees;

use hr;
/*---Q14:Write a query to get the length of the employee names (first_name, last_name) from employees table---*/
SELECT first_name,last_name, LENGTH(first_name)+LENGTH(last_name)  'Length of  Names' 
FROM employees;


/*---Q15:Write a query to check if the first_name fields of the employees table contains numbers---*/
SELECT first_name REGEXP  '[0-9]'
FROM employees; 


/*---Q16:Write a query to display the name (first_name, last_name) and salary for all employees whose salary is
not in the range $10,000 through $15,000---*/
SELECT first_name, last_name, salary 
FROM employees WHERE salary NOT between 10000 and 15000;


/*---Q17:Write a query to display the name (first_name, last_name) and department ID of all employees in
departments 30 or 100 in ascending order---*/
SELECT first_name, last_name, department_id FROM employees 
WHERE department_id IN (30, 100) 
ORDER BY  department_id  ASC;


/*---Q18:Write a query to display the name (first_name, last_name) and salary for all employees whose salary is
not in the range $10,000 through $15,000 and are in department 30 or 100---*/
SELECT first_name, last_name, salary,  department_id
FROM employees
 WHERE salary NOT between 10000 and 15000 and department_id IN (30, 100);
 
 
 /*---Q19:Write a query to display the name (first_name, last_name) and hire date for all employees who were
hired in 1987                          Ans:Steven King and Jennifer Whalen hired in 1987---*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE"1987%";


 /*---Q20:Write a query to display the first_name of all employees who have both "b" and "c" 
 in their first name                      Ans:Bruce---*/
SELECT first_name
FROM employees
WHERE first_name LIKE '%b%'
AND first_name LIKE '%c%';


/*---Q21:Write a query to display the last name, job, and salary for all employees whose job is that of a
Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000---*/
SELECT  last_name, job_id, salary 
FROM employees
WHERE job_id IN ("IT_PROG" ,"SH_CLERK") and salary NOT IN (4500,10000,15000);
 
 
 /*---Q22:Write a query to display the last name of employees whose names have exactly 6 characters---*/
SELECT  last_name
FROM employees
WHERE last_name LIKE "______"; 


/*---Q23:Write a query to display the last name of employees having 'e' as the third character---*/
SELECT  last_name
FROM employees
WHERE last_name LIKE "__e%"; 


/*---Q24:Write a query to get the job_id and related employee's id
    Partial output of the query :
 job_id                 Employees ID
AC_ACCOUNT                  206
AC_MGR                      205
AD_ASST                     200
AD_PRES                     100
AD_VP                     101 ,102
FI_ACCOUNT           110 ,113 ,111 ,109 ,112---*/
SELECT job_id, GROUP_CONCAT(employee_id) AS 'Employees ID' 
FROM employees GROUP BY job_id;


/*---Q25:Write a query to update the portion of the phone_number in the employees table, within the phone
number the substring '124' will be replaced by '999'---*/
UPDATE employees SET phone_number = REPLACE(phone_number, "124", "999") WHERE phone_number LIKE '%124%';


/*---Q26:Write a query to get the details of the employees where the length of the first name greater than or
equal to 8---*/
SELECT * FROM EMPLOYEES WHERE LENGTH(first_name) >= 8;


/*---Q27:Write a query to append '@example.com' to email field---*/
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(50) NOT NULL;
UPDATE employees SET email =concat(email,"@example.com");


/*---Q28:Write a query to extract the last 4 character of phone numbers---*/
SELECT RIGHT(phone_number, 4) as 'Ph.No.' FROM employees;


/*---Q29:Write a query to get the last word of the street address---*/
SELECT location_id, street_address, 
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1) 
AS 'Last--word-of-street_address' 
FROM locations;


/*---Q30:. Write a query to get the locations that have minimum street length---*/
SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);


/*---Q31:Write a query to display the first word from those job titles which contains more than one words---*/
SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1) AS first_word_of_job_title FROM jobs;


/*---Q32:Write a query to display the length of first name for employees where last name contain character 'c'
after 2nd position---*/	
SELECT first_name, last_name, length(first_name) as length_of_the_first_name_starts_where_last_name_contains_C_after_2nd_position
FROM employees 
 WHERE last_name LIKE "__%c%" ; 


/*---Q33:Write a query that displays the first name and the length of the first name for all employees whose
name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the
employees' first names---*/	
SELECT first_name, length(first_name) as length_of_the_first_name_starts_with_the_letters_A_or_J_or_M
FROM employees 
 WHERE first_name LIKE "a%" or "j%" or "m%"; 
 
 USE hr;
 /*---Q34:Write a query to display the first name and salary for all employees. Format the salary to be 10
characters long, left-padded with the $ symbol. Label the column SALARY---*/
SELECT first_name,
LPAD(salary, 10, '$') SALARY
FROM employees;


/*---Q35:Write a query to display the first eight characters of the employees' first names and indicates the 
amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in 
descending order of salary---*/
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000))'SALARY($)', salary
 FROM employees
 ORDER BY salary DESC;


/*---Q36:Write a query to display the employees with their code, first name, last name and hire date who hired 
either on seventh day of any month or seventh month in any year---*/
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;