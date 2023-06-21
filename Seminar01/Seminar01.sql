DROP DATABASE IF EXISTS seminar1_db;
CREATE DATABASE seminar1_db;
USE seminar1_db;

CREATE TABLE `mobilephones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(40) NOT NULL,
  `Manufacturer` varchar(40) NOT NULL,
  `ProductCount` int DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_mobilePhones_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `mobilePhones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone X', 'Apple', 3, 76000);
INSERT INTO `mobilePhones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('iPhone 8', 'Apple', 2, 51000);
INSERT INTO `mobilePhones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S9', 'Samsung', 2, 56000);
INSERT INTO `mobilePhones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('Galaxy S8', 'Samsung', 1, 41000);
INSERT INTO `mobilePhones` (`ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('P20 Pro', 'Huawei', 5, 36000);

SELECT ProductName, Manufacturer, Price FROM mobilephones where ProductCount > 2;
SELECT * FROM mobilephones WHERE Manufacturer = 'Samsung';
SELECT * FROM mobilephones WHERE ProductName lIKE '%iPhone%';
SELECT * FROM mobilephones WHERE ProductName lIKE '%8%';