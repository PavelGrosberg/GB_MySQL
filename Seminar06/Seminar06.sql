DROP DATABASE IF EXISTS seminar6_db;
CREATE DATABASE seminar6_db;
USE seminar6_db;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE TABLE `time` 
(`time_id` INT PRIMARY KEY AUTO_INCREMENT, 
`seconds` INT);

INSERT INTO `time` (`seconds`) 
VALUES (123456);

DELIMITER $$
CREATE FUNCTION `format_time`(`val` INT)
RETURNS char(45)
DETERMINISTIC
BEGIN
	DECLARE `DD` CHAR(3);
	DECLARE `HH`, `MI`, `SS` CHAR(2);
	DECLARE `result` CHAR(50);
	SET `DD` = cast(floor(`val`/60/60/24) AS CHAR(3));
	SET `HH` = cast(floor(mod(`val`/60/60/24,1)*24) AS CHAR(2));
	SET `MI` = cast(floor(mod(mod(`val`/60/60/24,1)*24,1)*60) AS CHAR(2));
	SET `SS` = cast(round(mod(mod(mod(`val`/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
  SET `result` = concat(`DD`,' days ',`HH`,' hours ',`MI`,' minutes ',`SS`,' seconds ');
RETURN `result`;
END $$

SELECT `format_time` (`seconds`) AS `result` from `time`; 

-- Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10

CREATE TABLE `numbers` 
(`id_numbers` INT PRIMARY KEY AUTO_INCREMENT, 
`odd_even` VARCHAR(4));

INSERT INTO `numbers` (`odd_even`) 
VALUES ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd'),
       ('Even'), ('Odd');

SELECT `id_numbers` FROM `numbers` WHERE `id_numbers` % 2 = 0; 
