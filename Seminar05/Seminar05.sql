DROP DATABASE IF EXISTS seminar5_db;
CREATE DATABASE seminar5_db;
USE seminar5_db;

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
    
SELECT * FROM cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW `cheap_cars` AS SELECT * FROM `cars` WHERE `cost` <= 25000;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW `cheap_cars` AS SELECT * FROM `cars` WHERE `cost` <= 30000;

-- 3.   Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW `skoda_audi` AS SELECT * FROM `cars` WHERE `name` = 'skoda' OR `name` = 'audi';

-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT ROW_NUMBER() OVER(ORDER BY `cost`) AS `row_number`, `cars`.*  FROM `cars` ;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT `cars`.*, SUM(`cost`) OVER() AS `sum` FROM `cars` ORDER BY `cost` DESC LIMIT 3 ;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены
CREATE VIEW `view_lag` AS select `cars`.*, LAG(`cost`) OVER() AS `lag` FROM `cars`;
SELECT * FROM `view_lag` WHERE `cost` > `lag`;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены 
CREATE VIEW `view_lead` AS select `cars`.*, Lead(`cost`) OVER() AS `lead` FROM `cars`;
SELECT * FROM `view_lead` WHERE `cost` < `lead`;

-- 5*Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
SELECT  `cars`.*, `cost` - LEAD(`cost`) OVER() AS `diff` FROM `cars` ORDER BY `cost`; 



