DROP SCHEMA IF EXISTS homework_2;
CREATE SCHEMA IF NOT EXISTS homework_2;
USE homework_2;

# Используя операторы языка SQL, создайте таблицу “sales”

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE, 
count_product INT 
);

SELECT * FROM sales;

# Заполните ее данными

INSERT sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;

# Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
# меньше 100  -    Маленький заказ
# от 100 до 300 - Средний заказ
# больше 300  -     Большой заказ

 SELECT
 id AS 'id заказа',
 IF (count_product < 100, 'Маленький заказ', 
 IF (count_product >= 100 AND count_product <= 300, 'Средний заказ', 'Большой заказ')) 
 AS 'Тип заказа'
 FROM sales;
 
# Создайте таблицу “orders”, заполните ее значениями

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount decimal(10,2) NOT NULL,
order_STATUS VARCHAR(10) NOT NULL 
);

SELECT * FROM orders;

INSERT orders (employee_id, amount, order_STATUS)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

# В зависимости от поля order_status выведите столбец
# full_order_status:
# OPEN – «Order is in open state» ;
# CLOSED - «Order is closed»;
# CANCELLED -  «Order is cancelled»

SELECT order_STATUS, employee_id,
CASE
WHEN order_STATUS = 'OPEN' THEN 'Order is in open state'
WHEN order_STATUS = 'CLOSED' THEN 'Order is closed'
ELSE 'Order is cancelled'
END AS full_order_status 
FROM orders;