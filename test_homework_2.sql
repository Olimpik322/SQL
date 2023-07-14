-- создаем таблицу Universities.

create table Universities (
id INT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
city VARCHAR(255)
);

-- заполняем таблицу Universities.

insert into Universities (id, name, city) 
values (1, 'Университет им. Иванова', 'Москва'),
       (2, 'Университет им. Петрова', 'Санкт-Петербург'),
       (3, 'Университет им. Сидорова', 'Екатеринбург');

-- вывести только название университета.

select name from Universities;

-- вывести город и название.

select city, name from Universities;

-- создаем таблицу students.

create table students (
fullname varchar(255),
universityid int,
graduationyear int,
foreign key(universityid) references universities(id)
);

-- заполняем таблицу students.

insert into book (fullname, universityid, graduationyear)
values ('Иванов Иван Иванович', 1, 2020),
       ('Петров Петр Петрович', 2, 2019),
       ('Сидорова Анна Сергеевна', 3, 2021),
       ('Смирнов Дмитрий Алексеевич', 1, 2022),
       ('Козлова Екатерина Ивановна', 2, 2023);

-- вывести все поля из таблицы students.

select * from students;

-- вывести только имя. 

select fullname from students;

-- вывести студентов где в имени есть слово Анна.

select * from students 
where fullname like '%Анна%';

-- выводим университет и кол-во студентов, закончивших его в 2020 году 

select Universities.name AS UniversityName,
count(students.fullname) AS graduatecount
from universities
left join students on universities.id = students.universityid
where students.graduationyear = 2020
group by universities.name; 

-- заменяем содержимое в столбце 

update students
set fullname ='Светлов Евгений Викторович'
where universityid=1;













