/*
Урок 5. SQL – оконные функции
Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

DROP SCHEMA IF EXISTS hw5;
CREATE SCHEMA IF NOT EXISTS hw5;
USE hw5;


CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE OR REPLACE VIEW cars_price_below AS 
SELECT *
FROM cars
WHERE cost < 25000;

select * from cars_price_below;

ALTER VIEW cars_price_below AS
SELECT *
FROM cars
WHERE cost < 30000;

select * from cars_price_below;

CREATE OR REPLACE VIEW cars_aui_skoda AS 
SELECT *
FROM cars
WHERE name IN ("Audi","Skoda");

select * from cars_aui_skoda;