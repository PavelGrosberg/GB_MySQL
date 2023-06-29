DROP DATABASE IF EXISTS seminar3_db;
CREATE DATABASE seminar3_db;
USE seminar3_db;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 22),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
*/

SELECT * FROM `staff` ORDER BY `salary`;
SELECT * FROM `staff` ORDER BY `salary` DESC;
SELECT `salary` FROM `staff` WHERE `salary` <= (SELECT MAX(`salary`) FROM `staff`) GROUP BY `salary` ORDER BY `salary` DESC LIMIT 5;
SELECT `post`, SUM(`salary`) AS `Суммарная ЗП` FROM `staff` GROUP BY `post`;
SELECT `post`, COUNT(`post`) AS `Количество человек на должности` FROM `staff` WHERE `age` BETWEEN 24 AND 49 GROUP BY `post`;
SELECT COUNT(DISTINCT `post`) AS `Количество специальностей` FROM `staff`;
SELECT `post`, AVG(`age`) AS `avg_age` FROM `staff` GROUP BY `post` HAVING `avg_age` <= 30;