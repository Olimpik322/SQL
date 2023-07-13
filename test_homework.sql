-- создаем таблицу Author

create table Author (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(255) NOT NULL,
date_birth DATE,
date_death DATE,
homeland VARCHAR(255)
);

-- заполняем таблицу Author

insert into employees (full_name, date_birth, date_death, homeland) 
values ('John Writer', '1990-01-01', '2050-01-01', 'Russia'),
       ('Novelist Smith', '2000-01-01', '2060-01-01', 'USA'),
       ('Author Johnson', '2010-01-01', '2070-01-01', 'China'),
       ('Henry Poet', '2020-01-01', NULL, 'Canada'),
       ('Duke O''Maniac', '2030-01-01', '2090-01-01', 'Romania');

-- выводим все поля из таблицы Author

select * from Author;

-- создаем таблицу book

create table book (
id int not null AUTO_INCREMENT primary key,
author_id int not null,
name varchar(255) not null,
foreign key(author_id) references Author(id)
);

-- заполняем таблицу book

insert into book (author_id, name)
values (2, 'The Name of Book'),
       (3, 'Nameless'),
       (1, 'A Book'),
       (5, 'Yet Another One'),
       (5, 'Whatever');

-- выводим все поля из таблицы book

select * from book;

-- создаем таблицу Edition

create table Edition (
id int not null AUTO_INCREMEN primary key,
book_id int not null,
date_published date,
number_copies int,
country_published varchar(255),
foreign key(book_id) references book(id)
);

-- заполняем таблицу Edition

insert into Edition (book_id, date_published, number_copies, country_published)
values (1, '2020-01-01', 100, 'Russia'),
       (1, '2030-01-01', 500, 'USA'),
       (3, '2040-01-01', 900, 'China')
       (3, '2050-01-01', 1300, 'Canada'),
       (5, '2060-01-01', 1700, 'Romania');

-- выводим все поля из таблицы Edition

select * from Edition;

-- выводим значение авторов переживших 23.10.2077

select * from author
where date_death>'2077-10-23' or date_death is null;

-- выводим значение книг издавшиеся после смерти автора 

select book.name, edition.date_published
from book
join author on book.author_id=author.id
join edition on book.id=edition.book_id
where edition.date_published>author.date_death;













