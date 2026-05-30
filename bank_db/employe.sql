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

select * from employee
where emp_id = 5;


select * from employee
where emp_id = 5;

select fname, emp_id, salary from employee
where salary >= 50000;

select * from employee 
where dept = 'HR' or dept ='IT';

select * from employee 
where salary >= 53000 and dept ='IT';

-- if you dont want to add multiple or then use in

select * from employee 
where dept in('HR','IT');

select * from employee 
where salary >= 50000 and salary < 55000;

-- rater then using this we can use between 

select * from employee
where salary between 50000 and 55000;

select distinct dept from employee;

select * from employee order by fname desc;


-- print the value whose name start from a we will use like then 


select * from employee where fname like 'A%';
-- start from A but if i write %a then the name who ends witth a

--  %i% where i is in middle
--  like '--' where 2 character 

select * from employee where dept like '__';
select * from employee where dept like '_a%';


select count(fname) from employee;




-- 
select concat('hello','world');

select  concat(fname,lname) from employee ;


select  concat(fname,lname) as fullname from employee ;



--printing multiple column you need to write as 
select emp_id, concat(fname,lname) as fullname , dept from employee ;

--concat with seperator
select emp_id, concat(fname, ' ',lname) as fullname , dept from employee ;


select emp_id, concat_ws('_',fname,lname) as fullname , dept from employee ;




-- 1:Find Total no. of employees in database?
-- 2: Find no. of employees in each department.
-- 3: Find lowest salary paying
-- 4: Find highest salary paying
-- 5: Find total salary paying in finance department?
-- 6: Average salary paying in each department

select count(*) from employee;
select dept, couunt(dept) from employee group by dept;
select min(salary) from employee;
select max(salary) from employee;
--to display all field with max salary
select * from employee order by salary desc limit 1;
select sum(salary) from employee where dept='finance';
select dept, avg(salary) from employee group by dept;



--query inside query

select * from employee where salary = (select max(salary) from employee);


 -- add table
alter table employee
add column city varchar(50);

-- delete table
alter table employee 
drop column city;

-- rename table
alter table employee
rename to employees;


alter table employee
alter column fname
set default 'unknown';


alter table employee
alter column fname
drop default;

alter table employee
add column 
 phone varchar(50) 
 check (length(phone) >= 10);


 select fname, salary ,
case 
when salary > 50000 then 'high' 
else 'low'
end as salary_cat from employee;