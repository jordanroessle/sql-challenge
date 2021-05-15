/* List the following details of each employee: 
	employee number, last name, first name, sex, and salary. */

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e 
inner join salaries as s 
on e.emp_no = s.emp_no;



/* List first name, last name, and hire date for employees who were hired in 1986. */

select first_name, last_name, hire_date 
from employees
where hire_date between '1986-1-1' and '1986-12-31';



/* List the manager of each department with the following information: department number,
	department name, the manager's employee number, last name, first name. */

select d.dep_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
inner join dep_manager as m
on d.dep_no = m.dep_no
inner join employees as e 
on m.emp_no = e.emp_no;



/* List the department of each employee with the following information: 
	employee number, last name, first name, and department name. */

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e 
inner join demp_emp
on demp_emp.emp_no = e.emp_no
inner join departments as d
on d.dep_no = demp_emp.dep_no;



/* List first name, last name, and sex for employees whose first name 
	is "Hercules" and last names begin with "B." */

select first_name, last_name, gender from employees 
where first_name = 'Hercules'
and last_name like 'B%'



/*List all employees in the Sales department, including their employee number, 
	last name, first name, and department name. */

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e 
inner join demp_emp
on demp_emp.emp_no = e.emp_no
inner join departments as d
on d.dep_no = demp_emp.dep_no
where d.dept_name = 'Sales'



/*List all employees in the Sales and Development departments, including their 
	employee number, last name, first name, and department name. */

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e 
inner join demp_emp
on demp_emp.emp_no = e.emp_no
inner join departments as d
on d.dep_no = demp_emp.dep_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development'



/* In descending order, list the frequency count of employee last names, i.e., 
	how many employees share each last name. */

select last_name, count(last_name) as "Frequency Count"
from employees
group by last_name
order by "Frequency Count" desc