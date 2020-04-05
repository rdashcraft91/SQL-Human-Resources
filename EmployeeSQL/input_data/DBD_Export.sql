DROP TABLE IF EXISTS "Departments", 
					 "Employee Information",
					 "Department Employees",
					 "Department Managers",
					 "Salaries",
					 "Titles";

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LnoLT3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employee Information" (
    "emp_no" Int   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "gender" varchar(50)   NOT NULL,
    "from_date" Date   NOT NULL,
    CONSTRAINT "pk_Employee Information" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department Employees" (
    "id" serial   NOT NULL,
    "emp_no" Int   NOT NULL,
    "dept_no" varchar(50)   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Department Employees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Department Managers" (
    "id" serial   NOT NULL,
    "dept_no" varchar(50)   NOT NULL,
    "emp_no" Int   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Department Managers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Salaries" (
    "id" serial   NOT NULL,
    "emp_no" Int   NOT NULL,
    "salary" Int   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Titles" (
    "id" serial   NOT NULL,
    "emp_no" Int   NOT NULL,
    "title" varchar(100)   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Department Employees" ADD CONSTRAINT "fk_Department Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee Information" ("emp_no");

ALTER TABLE "Department Employees" ADD CONSTRAINT "fk_Department Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department Managers" ADD CONSTRAINT "fk_Department Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department Managers" ADD CONSTRAINT "fk_Department Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee Information" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee Information" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee Information" ("emp_no");

