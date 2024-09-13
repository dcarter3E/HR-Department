-- 7 Key Questions

-- 1. Who are the top 10 earners in the organization?
SELECT emp.id, emp.first_name, emp.last_name, sal.salary 
FROM employees as emp
JOIN salaries as sal on emp.id = sal.employee_id 
ORDER BY sal.salary DESC
LIMIT 10;


-- 2. How are the employees distributed in the departments, i.e. what is the employee count in each department?
select dep.name, count(emp.id)
from departments as dep
join employees as emp on dep.id = emp.department_id
group by dep.name
order by count(emp.id) desc;


-- 3. What is the average salary by department?
select dep.name, avg(sal.salary)
from departments as dep
join employees as emp on dep.id = emp.department_id
join salaries as sal on emp.id = sal.employee_id 
group by dep.name;


-- 4. Show employees with multiple salaries.
select emp.id, emp.first_name, emp.last_name, sal.salary
FROM employees as emp
JOIN salaries as sal on emp.id = sal.employee_id 
where emp.id IN
(
	select employee_id
	from salaries
	group by employee_id
	having count(*) >1
);

20 54 1 <-- Employee ids with multiple salaries based on subquery above
	
--Ran a query to double check that those 3 employee ids had mulitple salaries
select * 
from salaries 
where employee_id in (20, 54, 1)
order by employee_id;


-- 5. What is the employee count by job title?
select tle.name, count(emp.id)
from titles as tle
join employees as emp on tle.id = emp.title_id
group by tle.name
order by count(emp.id) desc;


-- 6. What is the average salary by job title?
select tle.name, avg(sal.salary)
from titles as tle
join employees as emp on tle.id = emp.title_id
join salaries as sal on emp.id = sal.employee_id 
group by tle.name
order by avg(sal.salary) desc;


-- 7. How has the average salary changed over time, and are there any notable trends?
select extract(year from start_date) as start_year, avg(salary)
from salaries
group by start_year
order by start_year;

-- Overall, avg salary has descreased from 2018 - 2023. From 18-19 it increased slightly, then descreased the next three years 20, 21, and 22. Increased slightly in 23. 










