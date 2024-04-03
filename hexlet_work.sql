--- Было решено, что участвовать в конкурсе могут только пользователи, зарегистрированные ранее 2020 года, или пользователи, зарегистрированные с почты @gmail.com. 
--- В силу того, что призы довольно специфичные, возраст пользователя должен быть от 18 и до 50 лет включительно. 
--- На тех, кто зарегистрирован ранее 2020 года, возрастные ограничения не распространяются - компания подберет им индивидуальные подарки
--- Составьте запрос, который извлекает из таблицы profiles данные о пользователях, которым позволено участвовать в конкурсе.
SELECT username, email, age
FROM profiles
WHERE created_at < '2020-01-01' OR (email LIKE '%@gmail.com' AND age >= 18 AND age <= 50)
ORDER BY age ASC;

--- Напишите запрос, который извлекает из таблицы заказов orders всех пользователей, которые сделали заказ не менее двух раз.
--- Отсортируйте выборку по общей стоимости заказов в порядке убывания. 
SELECT
    buyer_id,
    COUNT(*) AS orders_count,
    SUM(price) AS total_price
FROM orders
GROUP BY buyer_id
HAVING COUNT(*) >= 2
ORDER BY total_price DESC;

--- Напишите запрос, который найдет в таблице staff максимальную и минимальную зарплату (поле salary) для каждой должности (поле job_title).
SELECT job_title, MAX(salary) as max_salary,
MIN(salary) as min_salary
FROM staff
GROUP BY job_title
ORDER BY job_title;

--- Составьте запрос, который извлекает из таблицы статей articles названия статей (поле title), которые были созданы пользователями с именем на букву А. 
SELECT title FROM articles
WHERE creator_id IN (
    SELECT id FROM users
    WHERE first_name SIMILAR TO 'A%'
);

--- В базе данных есть две таблицы – товары и категории товаров. 
--- Составьте запрос, который получит все товары и название категории, в которой он находится. Итоговая таблица должна иметь поля product и category. 
--- Отсортируйте выборку по названию категории и названию товара.
SELECT 
categories.name AS category,
products.name AS product
FROM categories 
INNER JOIN products
ON products.category_id = categories.id
ORDER BY category, product;

--- В базе данных есть две таблицы – студенты и участники курса.
--- Составьте запрос, который получит имена и фамилии студентов, которые обучаются на курсе по физике (physics).
--- Отсортируйте выборку по фамилии и имени студентов в прямом порядке.
SELECT first_name, last_name
FROM students 
INNER JOIN course_members 
ON course_members.student_id = students.student_id 
WHERE course_name = 'physics'
ORDER BY last_name, first_name;

--- В этом упражнении мы будем работать с интернет-магазином. У нас есть три таблицы.
--- Составьте запрос, который получит всех покупателей, которые сделали заказы в 2022 году. 
--- Итоговая таблица должна содержать имя и фамилию покупателя (поля first_name и last_name), название товара (product) и его цену (price).
--- Отсортируйте итоговую таблицу по цене в порядке убывания.
SELECT 
first_name, last_name,
pro.title AS product,
price 
FROM users 
INNER JOIN orders 
ON users.id = orders.user_id
INNER JOIN products AS pro
ON  pro.id = orders.product_id 
WHERE created_at BETWEEN '2022-01-01' AND '2022-12-31'
ORDER BY price DESC;
