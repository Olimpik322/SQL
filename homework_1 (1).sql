-- создаем таблицу employees

create table employees (
id serial primary key,
employee_name varchar(50) not null
);

-- выводим все поля из таблицы employees

select * from employees;

-- заполняем таблицу employees

insert into employees (id, employee_name) 
values (default, 'Andrey Kuznetsov');

-- создаем таблицу salary

create table salary (
id serial primary key,
monthly_salary int not null
);

-- выводим все поля из таблицы salary

select * from salary;

-- заполняем таблицу salary

insert into salary (id, monthly_salary)
values (default, 2400);

-- создаем таблицу employee_salary

create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

-- выводим все поля из таблицы employee_salary

select * from employee_salary;

-- заполняем таблицу employee_salary

insert into employee_salary (id, employee_id, salary_id)
values (default, 40, 10);

-- создаем таблицу roles

create table roles (
id serial primary key,
role_name int not null unique
);

-- меняем тип поля role_name в таблице roles 

alter table roles 
alter column role_name type varchar(30);

-- выводим все поля из таблицы roles

select * from roles;

-- заполняем таблицу roles

insert into roles (id,role_name)
values (default, 'Senior Automation QA engineer');

-- создаем таблицу roles_employee

create table roles_employee (
id serial primary key,
employee_id int not null unique, 
foreign key (employee_id) references employees (id),
role_id int not null,
foreign key (role_id) references roles (id)
);

-- выводим все поля из таблицы roles_employee

select * from roles_employee;

-- заполняем таблицу roles_employee

insert into roles_employee (id, employee_id, role_id)
values (default, 40, 20);












