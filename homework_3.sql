SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;

DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

-- ALTER TABLE staff MODIFY post VARCHAR(30);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


DROP TABLE IF EXISTS activity_staff;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY(staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);

INSERT `activity_staff` (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);


-- Задание 1. Выведите id сотрудников, которые напечатали более 500 страниц за все дни.
SELECT staff_id, SUM(count_pages) AS sum_pages
FROM activity_staff
GROUP BY staff_id
HAVING sum_pages > 500;

-- Задание 2. Выведите дни, когда работало более 3 сотрудников. 
-- Также укажите кол-во сотрудников, которые работали в выбранные дни.
SELECT COUNT(staff_id) AS staff_count, date_activity
FROM activity_staff
GROUP BY date_activity 
HAVING staff_count > 3; 

-- Задание 3. Выведите среднюю заработную плату по должностям, которая составляет более 30000.
SELECT post, AVG(salary) AS avg_salary
FROM staff
GROUP BY post
HAVING avg_salary > 30000; 

-- Задание 4. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания.
-- убывание
SELECT *
FROM staff
ORDER BY salary DESC; 

-- возрастание
SELECT *
FROM staff
ORDER BY salary ASC; 

-- Задание 5. Выведите 5 максимальных заработных плат (salary).
SELECT id, firstname, salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Задание 6. Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
SELECT post, SUM(salary) AS sum_salary
FROM staff
GROUP BY post;

-- Задание 7. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS number_workers
FROM staff
WHERE age between 24 AND 49
GROUP BY post 
HAVING post = 'Рабочий';

-- Задание 8. Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS number_of_post
FROM staff;

-- Задание 9. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT post, CAST(AVG(age) as UNSIGNED) as avg_age
FROM staff
GROUP BY age
HAVING avg_age < 30;