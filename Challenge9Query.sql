/*
Data Analysis
1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
*/

--query_1: List the employee number, last name, first name, sex, and salary of each employee.
create view query_1 as 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries 
on (employees.emp_no = salaries.emp_no)
order by salaries.salary desc;

--query_2: List the first name, last name, and hire date for the employees who were hired in 1986.
create view query_2 as 
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31'
order by hire_date;

--query_3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
create view query_3 as 
select titles.title, department_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
from employees
inner join department_manager 
on (employees.emp_no = department_manager.emp_no)
inner join departments 
on (departments.dept_no = department_manager.dept_no)
inner join titles 
on (titles.title_id = employees.emp_title_id)
order by departments.dept_name, employees.last_name;

--query_4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
create view query_4 as 
select department_employee.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_employee 
on (department_employee.emp_no = employees.emp_no)
inner join departments 
on (departments.dept_no = department_employee.dept_no);

--query_5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
create view query_5 as 
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name;

--query_6: List each employee in the Sales department, including their employee number, last name, and first name.
create view query_6 as 
select department_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join department_employee
on (department_employee.emp_no = employees.emp_no)
inner join departments 
on (departments.dept_no = department_employee.dept_no)
where departments.dept_name = 'Sales'
order by employees.last_name;

--query_7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
create view query_7 as 
select department_employee.emp_no, employees.last_name, employees.first_name, departments.dept_name
from department_employee
inner join employees
on (department_employee.emp_no = employees.emp_no)
inner join departments 
on (departments.dept_no = department_employee.dept_no)
where departments.dept_name in ('Sales','Development')
order by departments.dept_name, employees.last_name;
--query_8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
create view query_8 as 
select last_name,
count(last_name)
as last_name_frequency
from employees
group by last_name
order by last_name_frequency desc;
