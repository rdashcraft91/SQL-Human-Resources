-- List the following details of each employee: employee number, last name, first name, gender, and salary.

select 
	ei.emp_no as "Employee Number",
	ei.last_name as "Last Name",
	ei.first_name as "First Name",
	ei.gender as "Gender",
	sa.salary as "Salary"
from
	"Employee Information" as ei
join "Salaries" as sa on
	ei.emp_no=sa.emp_no
;

-- List employees who were hired in 1986.

select 
	first_name as "First Name", 
	last_name as "Last Name",
	from_date as "Hire Date"
from
	"Employee Information"
where
	from_date between '1986-01-01' and '1986-12-31'
group by "First Name", "Last Name", "Hire Date"
order by "Hire Date";

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select
	ei.first_name as "First Name",
	ei.last_name as "Last Name",
	dm.dept_no as "Department Number",
	d.dept_name as "Department Name",
	dm.emp_no as "Employee Number",
	ei.from_date as "Began Employment",
	dm.to_date as "Ended Employment"
from "Departments" as d
left join "Department Managers" as dm on
	d.dept_no=dm.dept_no
left join "Employee Information" as ei on
	dm.emp_no = ei.emp_no
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select
	d.dept_name as "Department Name",
	de.emp_no as "Employee Number",
	ei.first_name as "First Name",
	ei.last_name as "Last Name"
from "Departments" as d 
join "Department Employees" as de on
	d.dept_no=de.dept_no
join "Employee Information" as ei on
	de.emp_no=ei.emp_no
;

-- List all employees whose first name is "Hercules" and last names begin with "B."

select
	first_name as "First Name",
	last_name as "Last Name"
from "Employee Information"
where first_name='Hercules' and last_name like 'B%'
group by "First Name", "Last Name"
order by "Last Name"
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
	de.emp_no as "Employee Number",
	ei.first_name as "First Name",
	ei.last_name as "Last Name",
	d.dept_name as "Department Name"
from "Departments" as d 
join "Department Employees" as de on
	d.dept_no=de.dept_no
join "Employee Information" as ei on
	de.emp_no=ei.emp_no
where d.dept_name='Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
	de.emp_no as "Employee Number",
	ei.first_name as "First Name",
	ei.last_name as "Last Name",
	d.dept_name as "Department Name"
from "Departments" as d 
join "Department Employees" as de on
	d.dept_no=de.dept_no
join "Employee Information" as ei on
	de.emp_no=ei.emp_no
where d.dept_name='Sales' or d.dept_name='Development'
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select
	last_name as "Last Name", count(last_name) as "Frequency"
from
	"Employee Information"
group by "Last Name"
order by "Frequency" desc
;
