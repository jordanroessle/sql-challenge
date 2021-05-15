-- drop tables if they exist
drop table if exists employees;
drop table if exists departments;
drop table if exists titles;
drop table if exists salaries;
drop table if exists demp_emp;
drop table if exists dep_manager;

--create tables 
create table employees (
	emp_no integer primary key,
	birth_date date,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	gender varchar(1) not null,
	hire_date date
);

create table departments (
	dep_no char(4) primary key,
	dept_name varchar(20) not null
);

create table titles (
	key serial primary key,
	emp_no integer, 
	title varchar(20) not null,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no)
);

create table salaries (
	emp_no integer primary key, 
	salary integer not null, 
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees(emp_no)
);

create table demp_emp (
	emp_no integer, 
	dep_no char(4), 
	from_date date,
	to_date date,
	primary key (emp_no, dep_no), 
	foreign key (emp_no) references employees(emp_no),
	foreign key (dep_no) references departments(dep_no)
);

create table dep_manager (
	dep_no char(4) not null,
	emp_no integer,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dep_no) references departments(dep_no)
);