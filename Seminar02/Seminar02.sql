DROP DATABASE IF EXISTS seminar2_db;
CREATE DATABASE seminar2_db;
USE seminar2_db;


CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `count_product` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_sales_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(40) NOT NULL,
  `amount` float DEFAULT NULL,
  `order_status` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_orders_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `sales` (`order_date`, `count_product`)
VALUES ('2022-01-01', 156), ('2022-01-02', 180), ('2022-01-03', 21),
	   ('2022-01-04', 124), ('2022-01-05', 341);
       
INSERT INTO `orders` (`employee_id`, `amount`, `order_status`)
VALUES ('e03', 15, 'OPEN'), ('e01', 25.5, 'OPEN'), ('e05', 100.70, 'CLOSED'),
	   ('e02', 22.18, 'OPEN'), ('e04', 9.50, 'CANCELLED');       

SELECT `id` as `id заказа`,
	CASE 
		WHEN `count_product` < 100 THEN 'Маленький заказ'
		WHEN `count_product` between 100 AND 300 THEN 'Средний заказ'
		WHEN `count_product` > 300 THEN 'Большой заказ'
	END as 'Тип заказа'
FROM `sales`;

SELECT `id` as `id заказа`,
IF (`count_product` < 100, 'Маленький заказ', 
	IF(`count_product` between 100 AND 300, 'Средний заказ', 'Большой заказ'))
AS 'Тип заказа'
FROM `sales`;

SELECT `id` as `id заказа`,
	CASE `order_status` 
		WHEN 'OPEN' THEN 'Order is in open state'
		WHEN 'CLOSED' THEN 'Order is closed'
		WHEN 'CANCELLED' THEN 'Order is cancelled'
	END as 'full_order_status'
FROM `orders`;
