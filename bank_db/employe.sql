select * from employee;

SELECT current_database();


create table employee(
	emp_id serial primary key,
	fname varchar(20) not null,
	lastname varchar(20) not null,
	email varchar(20) unique not null,
	dept varchar(15) ,
	salary decimal(8,2) default 30000.00,
	hire_date date default current_date
);


alter table employee
alter column email type varchar(50);

alter table employee
rename column lastname to lname;

insert into employee (emp_id, fname,lname,email,dept,salary,hire_date)
values 
(1, 'Raj', 'sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15');

-- run this command to different database because it dont allow current database to rename
alter database employee 
rename to bank_db;


-- if you provided serial then dont insert data manually because if you insert data and then remove that data in next quary that may give error as it clash the serial value and you have to reset the serial value to avoid that error

insert into employee (emp_id, fname, lname, email, dept, salary, hire_date)
values 
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');


-- select setval('employee_emp_id_seq',1) //set value to 1 you have to set that manually in psql terminal if you manually entered the serial data and again you want to reset that data 

--and to get the name \d employee to get the data of table copy the name 'employee_emp_id_seq' from there 
