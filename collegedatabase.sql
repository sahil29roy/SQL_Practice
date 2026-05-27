select * from students;

create table students(
student_id SERIAL PRIMARY KEY,
first_name varchar(20),
last_name varchar(20),
gender varchar(10),
dob date,
email varchar(50) unique,
phone varchar(15),
city varchar(25),
state varchar(25),
admission_year int,
course varchar(20),
cgpa decimal(3,2),
scholarship boolean default false
);

alter table students
alter column first_name set not null;



#department 

create table departments (
	department_id serial primary key,
	department_name varchar(20) unique not null,
	hod_name varchar(25),
	total_staff int check(total_staff >= 0)
);


#course

create table courses (
course_id serial primary key ,
course_name varchar(100),
department_id int references departments(department_id),
credits int check(credits > 0)
);

#enrollments

create table enrollments(
enrollments_id serial primary key,
student_id int references students(student_id),
course_id int  references courses(course_id),
semester varchar(20),
marks int check(marks between 0 and 100),
grade varchar(2)

);



