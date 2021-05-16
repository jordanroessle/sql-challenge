-- drop tables if they exist
drop table if exists dep_manager;
drop table if exists demp_emp;
drop table if exists salaries;
drop table if exists titles;
drop table if exists departments;
drop table if exists employees;


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
	
	 not null
);

create table titles (
	emp_no integer, 
	title varchar(20) not null,
	from_date date not null,
	to_date date not null,
	primary key (emp_no, from_date),
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
	from_date date not null,
	to_date date not null,
	primary key (emp_no, dep_no), 
	foreign key (emp_no) references employees(emp_no),
	foreign key (dep_no) references departments(dep_no)
);

create table dep_manager (
	dep_no char(4),
	emp_no integer primary key,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dep_no) references departments(dep_no)
);


-- imports the csv files for my personal pc
/*
copy public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/EMPLOY~1.CSV' 
CSV HEADER;

copy public.departments (dep_no, dept_name) 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/DEPART~1.CSV' 
CSV HEADER;

copy public.titles (emp_no, title, from_date, to_date) 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/titles.csv' 
CSV HEADER;

copy public.salaries 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/salaries.csv' 
CSV HEADER;

copy public.demp_emp 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/dept_emp.csv' 
CSV HEADER;

copy public.dep_manager 
FROM 'C:/Users/JORDAN~1/Desktop/homework/09-hw/SQL-CH~1/EMPLOY~1/CSV_FI~1/DEPT_M~1.CSV' 
CSV HEADER;
*/