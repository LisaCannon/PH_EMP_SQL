# PH Employee Data Engineering

### Steps taken to Create the Table Schema
1. After completing the ERD chart, the Postgres SQL code for the schema was derived by using the QuickDBD tool.
2. The following tables with their variables were created
    1. Departments
        1. dept_no
        2. dept_name
    2. dept_emp
        1. emp_no
        2. dept_no
        3. from_date
        4. to_date
    3. dept_manager
        1. emp_no
        2. dept_no
        3. from_date
        4. to_date
    4. employees
        1. emp_no
        2. birth_date
        3. first_name
        4. last_name
        5. gender
        6. hire_date
    5. salaries
        1. emp_no
        2. salary
        3. from_date
        4. to_date
    6. titles
        1. emp_no
        2. title
        3. from_date
        4. to_date
### Set Data Types
1. All date variables were given the DATE data type
2. VARCHAR variables with a set length are restricted

### Keys, Constraints
#### Primary Keys
* employees table: emp_no
* Departments table: dept_no

#### Foreign Keys
* dept_emp table: 
    1. emp_no, connects to employees table
    2. dept_no, connects to Departments table
* dept_manager:
    1. emp_no, connects to employees table
    2. dept_no, connects to Departments table
* salaries: emp_no, connects to employees table
* titles: emp_no, connects to employees table

### Importing Data
* CSV files are then imported to populate the tables.  
* Note that it is necessary to import the tables with primary keys before importing tables with foreign keys that connect to those primary keys.


