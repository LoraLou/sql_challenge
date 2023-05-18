/*
Data Engineering
Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.
*/

--create table "departments" & primary key
create table departments(
	dept_no varchar (30) not null,
	dept_name varchar (30) not null,
	primary key (dept_no)
);
select * from departments;

--create table "department_employee" & primary key
create table department_employee(
	emp_no int (20) not null,
	dept_no varchar (30) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);
select * from department_employee;

--create table "department_manager" & primary key
create table department_manager(
	dept_no varchar (30) not null,
	emp_no int (20) not null,
	primary key(dept_no, emp_no),
	foreign key(dept_no) references departments (dept_no),
	foreign key(emp_no) references employees (emp_no)
);
select * from department_manager;

--create table "employees" & primary key
create table employees (
	emp_no int (20) not null,
	emp_title_id varchar (30) not null,
	birth_date date not null,
	first_name varchar (30) not null,
	last_name varchar (30) not null,
	sex character (1),
	hire_date date not null,
	primary key(emp_no),
	foreign key(emp_title_id) references titles (title_id)
);
select * from employees;

--create table "salaries" & primary key
create table salaries (
	emp_no int (20) not null,
	salary int (20) not null,
	primary key(emp_no, salary),
	foreign key(emp_no) references employees (emp_no)
);
select * from salaries;

--create table "titles" & primary key
create table titles(
	title_id varchar (30) not null,
	title varchar (30) not null,
	primary key(title_id)
);
select * from titles;